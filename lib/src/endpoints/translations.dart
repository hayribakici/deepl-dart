// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '../../deepl.dart';

/// Endpoint for handling text translations.
class Translations extends DeepLEndpoint {
  @override
  String get _path => 'translate';

  Translations(super.api);

  /// Translates text with given [options]. Returns
  ///
  /// Build [options] with the [TranslateTextRequestOptionsBuilder].
  Future<Iterable<Translation>> translateText(
      {required TranslateTextRequestOptions options}) async {
    var json = options.toJson();
    String jsonString = await _post(_path, jsonEncode(json));
    var tJson = jsonDecode(jsonString)['translations'] as Iterable<dynamic>;
    return tJson.map((json) => Translation.fromJson(json));
  }

  /// Translates text with given [options]. Returns
  ///
  /// Build [options] with the [TranslateTextRequestOptionsBuilder.single].
  Future<Translation> translateSingleText(
          {required TranslateTextRequestOptions options}) async =>
      (await translateText(options: options)).first;
}
