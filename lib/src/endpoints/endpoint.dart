// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '../../deepl.dart';

/// Base class for an API endpoint
abstract class DeepLEndpoint {
  // ignore: unused_element
  String get _path;

  final DeepLApi _api;

  DeepLEndpoint(this._api);

  Future<String> _get(String path, {Map<String, String>? headers}) async =>
      _api._get(path, headers: headers);

  Future<String> _post(String path, String body,
          {Map<String, String>? headers}) async =>
      _api._post(path, body, headers: headers);

  Future<T> _handleGet<T>(String path,
      {required Function(Map<String, dynamic>) fromJson}) async {
    String jsonString = await _get(path);
    return fromJson(jsonDecode(jsonString));
  }

  Future<Iterable<T>> _handleList<T>(String path,
      {String? jsonKey,
      required Function(Map<String, dynamic>) fromJson}) async {
    String jsonString = await _get(path);
    var decode = jsonDecode(jsonString);
    var tJson =
        (jsonKey != null ? decode[jsonKey] : decode) as Iterable<dynamic>;
    return tJson.map((json) => fromJson(json));
  }
}
