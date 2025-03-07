// Copyright (c) 2025, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '../../deepl.dart';

///
class TextImprovements extends DeepLEndpoint {
  TextImprovements(super.api);

  @override
  String get _path => 'write/rephrase';

  Future<Iterable<TextImprovement>> improveText(
      {required TextImprovmentRequestOptions options}) async {
    var json = options.toJson();
    String jsonResponse = await _post(_path, jsonEncode(json));
    var tJson = jsonDecode(jsonResponse)['improvements'] as Iterable<dynamic>;
    return tJson.map((json) => TextImprovement.fromJson(json));
  }
}
