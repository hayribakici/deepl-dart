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
  /// Build [options] with the [TranslateRequestOptionsBuilder].
  Future<Iterable<Translation>> translateText(String text,
      {required TargetLanguage target,
      TranslateRequestOptions? options}) async {
    String jsonString = await _post(_path, jsonEncode(options?.toJson()));
    var tJson = jsonDecode(jsonString)['translations'] as Iterable<dynamic>;
    return tJson.map((json) => Translation.fromJson(json));
  }


  Future<DocumentStatus> translateDocument() async {
    var document = await _api.documents.uploadDocument("");
    return _api.documents.status(document.documentId, document.documentKey);
  }


}
