// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '../../deepl.dart';

/// Endpoint for requesting document translation.
class Documents extends DeepLEndpoint {
  Documents(super.api);

  @override
  String get _path => 'document';

  final supportedFileTypes = SupportetFileTypes.values.map((e) => e.name);

  /// Uploads a document referenced as [filename].
  Future<Document> uploadDocument(
      {required TranslateDocumentRequestOptions options}) async {
    var filename = options.filename;
    var extension = filename.split('.').last;
    if (!supportedFileTypes.contains(extension)) {
      throw ArgumentError(
          'File is unsupported file type. Allowed: ${supportedFileTypes.join(',')}');
    }
    var json =
        options.toJson().map((key, value) => MapEntry(key, value.toString()));
    print(json);
    var result = await _api._postFormData(_path, filename, fields: json);
    return Document.fromJson(jsonDecode(result));
  }

  /// Retrieve the [DocumentStatus] of the [document].
  ///
  /// The [DocumentStatus] can be either [StatusQueued], [StatusTranslating], [StatusDone] or
  /// [StatusError] based on the [TranslationStatus].s
  Future<MapEntry<TranslationStatus, DocumentStatus>> status(
      Document document) async {
    var jsonResponse = await _post('$_path/${document.documentId}',
        jsonEncode({'document_key': document.documentKey}));
    var dStatus = DocumentStatus.fromJson(jsonDecode(jsonResponse));
    return MapEntry(dStatus.translationStatus!, dStatus);
  }

  /// Downloads the translated [document] and saves it into [filename].
  /// Returns the created [File] reference.
  Future<File> downloadDocument(Document document, String filename) async {
    var response = await _api._postRaw('$_path/${document.documentId}/result',
        jsonEncode({'document_key': document.documentKey}));
    var bytes = response.bodyBytes;
    return File(filename).writeAsBytes(bytes);
  }

  Stream<DocumentStatus> _countDownStream(StatusTranslating document) {
    late StreamController<DocumentStatus> controller;
    Timer? timer;
    int remaining = document.secondsRemaining ?? 0;

    void tick(_) {
      --remaining;
      controller.add(
        StatusTranslating.fromRemainingSeconds(remaining),
      ); // Ask stream to send counter values as event.
      if (remaining <= 0) {
        timer?.cancel();
      }
    }

    void startTimer() {
      timer = Timer.periodic(Duration(seconds: remaining), tick);
    }

    void stopTimer() {
      timer?.cancel();
      timer = null;
    }

    controller = StreamController<DocumentStatus>(
        onListen: startTimer,
        onPause: stopTimer,
        onResume: startTimer,
        onCancel: stopTimer);

    return controller.stream;
  }

  Stream<DocumentStatus> translateDocument(
      TranslateDocumentRequestOptions options) async* {
    var document = await uploadDocument(options: options);
    var entry = await status(document);

    while (entry.key != TranslationStatus.done) {
      var translationStatus = entry.key;
      var documentStatus = entry.value;
      switch (translationStatus) {
        case TranslationStatus.queued:
          yield documentStatus as StatusQueued;
          await Future.delayed(Duration(seconds: 2));
          entry = await status(document);
        case TranslationStatus.translating:
          yield documentStatus as StatusTranslating;
          var remaining = documentStatus.secondsRemaining ?? 0;
          for (var i = remaining; i >= 0; --i) {
            await Future.delayed(Duration(seconds: 1));
            yield StatusTranslating()..secondsRemaining = i;
          }
          entry = await status(document);
          yield entry.value;
        case TranslationStatus.error:
          throw DeepLException(
              (documentStatus as StatusError).errorMessage ?? 'Error');
        default:
      }
    }
    var done = (entry.value) as StatusDone;
    var split = options.filename.split('/');
    var path = split[-2];
    var filename = split.last;
    var ext = filename.split('.').last;
    var newFilename = '${filename}_${options.target.name}.$ext';
    var f = await downloadDocument(document, '$path/$newFilename');
    done.file = f;
    yield done;
  }
}
