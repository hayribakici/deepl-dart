// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '../../deepl.dart';

/// Endpoint for calling the translation API
class Translations extends DeepLEndpoint {
  @override
  String get _path => 'translate';

  Translations(super.api);

  /// Translates text with a given target language with given [options].
  ///
  /// Build [options] with the [TranslateTextRequestOptionsBuilder].
  Future<Iterable<Translation>> translateText(
      {required TranslateTextRequestOptions options}) async {
    var json = options.toJson();
    String jsonString = await _post(_path, jsonEncode(json));
    var tJson = jsonDecode(jsonString)['translations'] as Iterable<dynamic>;
    return tJson.map((json) => Translation.fromJson(json));
  }

  /// Uploads and translates a document's with givenn [options].
  // Future<> translateDocument(
  //     {required TranslateDocumentRequestOptions options, StreamSubscription<int>? subscription}) async {
  //   var document = await _api.documents.uploadDocument(options: options);
  //   var status = await _api.documents.status(document);
  //   if (status.translationStatus == TranslationStatus.translating && subscription != null) {
  //     if (status.secondsRemaining != null) {
  //       var controller = timedCounter(Duration(seconds: 1), status.secondsRemaining);
  //       controller.listen();
  //     }
  //   }
  // return Stream.fromFutures([document, _api.documents.status(document)]);

  // if (status.translationStatus == TranslationStatus.translating)
  //   Future.delayed(Duration(seconds: status?.secondsRemaining)).then((value) => null);

  //   } else
}
