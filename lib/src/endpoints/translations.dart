// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '../../deepl.dart';

/// Endpoint for calling the translation API
class Translations extends DeepLEndpoint {
  @override
  String get _path => 'translate';

  Translations(super.api);

  /// Translates [text] with a given [target] language and [options].
  ///
  /// Build [options] with the [TranslateTextRequestOptionsBuilder].
  Future<Iterable<Translation>> translateText(List<String> text,
      {required TargetLanguage target,
      TranslateTextRequestOptions? options}) async {
    var json = options?.toJson() ?? {};
    json['text'] = text;
    json['target_lang'] = target.name;
    String jsonString = await _post(_path, jsonEncode(json));
    var tJson = jsonDecode(jsonString)['translations'] as Iterable<dynamic>;
    return tJson.map((json) => Translation.fromJson(json));
  }

  Future<DocumentStatus> translateDocument(String filename,
      {required TargetLanguage targetLanguage}) async {
    var document =
        await _api.documents.uploadDocument(filename, targetLanguage);
    return _api.documents.status(document.documentId, document.documentKey);
  }
}
