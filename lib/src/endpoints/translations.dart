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

  /// Uploads and translates a document's [filename] with given [targetLanguage].
  Future<DocumentStatus> translateDocument(
      {required TranslateDocumentRequestOptions options}) async {
    var document = await _api.documents
        .uploadDocument(options.filename, options.target, options: options);
    return _api.documents.status(document.documentId, document.documentKey);
  }
}
