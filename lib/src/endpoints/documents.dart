// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '../../deepl.dart';

///
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
  Future<MapEntry<TranslationStatus, DocumentStatus>> status<T>(
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

// TODO streamline document translation
  // Stream<DocumentStatus> translateDocument(TranslateDocumentRequestOptions options) {
  //   Stream.fromFuture(uploadDocument(options: options))
  //   .asyncMap((document) => status(document))
  //   .
  // }
}
