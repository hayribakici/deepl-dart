// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '../deepl.dart';

abstract class DeepLApi {
  final int version = 2;
  static const String _freeSuffix = ':fx';

  late String _key;
  late Client _client;
  late Documents _documents;
  late Translations _translations;
  late Glossaries _glossary;
  late Languages _languages;
  late Quotas _quotas;

  DeepLApi(String key, {BaseClient? client}) {
    _key = key;
    _client = client ?? Client();

    _documents = Documents(this);
    _glossary = Glossaries(this);
    _translations = Translations(this);
    _languages = Languages(this);
    _quotas = Quotas(this);
  }

  /// Create an instance with a given [key] and optional [client].
  factory DeepLApi.fromAuthKey(String key, {BaseClient? client}) =>
      key.endsWith(_freeSuffix)
          ? _DeepLFreeApi(key, client: client)
          : _DeepLProApi(key, client: client);

  Future<String> _get(String path, {Map<String, String>? headers}) async {
    var response = await _client.get(Uri.parse('$endpoint/$path'),
        headers: _buildRequestHeader(headers));
    return _handleResponse(
        response, () async => utf8.decode(response.bodyBytes));
  }

  Future<String> _post(String path, String body,
      {Map<String, String>? headers, BodyHandler? handler}) async {
    var response = await _client.post(Uri.parse('$endpoint/$path'),
        headers: _buildRequestHeader(headers), body: body);
    return _handleResponse(
        response, () async => utf8.decode(response.bodyBytes));
  }

  Future<Response> _postRaw(String path, String body,
      {Map<String, String>? headers}) async {
    var response = await _client.post(Uri.parse('$endpoint/$path'),
        headers: _buildRequestHeader(headers), body: body);
    return response;
  }

  Future<void> _delete(String path, {Map<String, String>? headers}) async {
    var response = await _client.delete(Uri.parse('$endpoint/$path'),
        headers: _buildBaseRequestHeader(headers));
    _handleResponse(response, () async => utf8.decode(response.bodyBytes));
  }

  // ignore: unused_element
  Future<String> _postFormData(String path, String filename,
      {Map<String, String>? headers, Map<String, String>? fields}) async {
    var field = filename.split('/').last;
    MultipartRequest request =
        MultipartRequest('POST', Uri.parse('$endpoint/$path'))
          ..headers.addAll(_buildBaseRequestHeader(headers))
          ..fields.addAll(fields ?? {})
          ..files.add(MultipartFile.fromBytes(
              field, File(filename).readAsBytesSync(),
              filename: field));
    var response = await request.send();
    // return await response.stream.bytesToString();
    return _handleResponse(
        response, () async => await response.stream.bytesToString());
  }

  Future<String> _handleResponse(
      BaseResponse response, Future<String> Function() body) async {
    final responseBody = await body();
    if (response.statusCode >= 400) {
      // TODO error handling
      print(responseBody);
      var error = DeepLError.fromJson(jsonDecode(responseBody));
      throw DeepLException.fromError(response.statusCode, error);
    }
    return responseBody;
  }

  Map<String, String> _buildBaseRequestHeader(Map<String, String>? headers) {
    var base = {HttpHeaders.authorizationHeader: 'DeepL-Auth-Key $_key'};
    if (headers == null) {
      headers = base;
    } else {
      headers.addAll(base);
    }
    return headers;
  }

  Map<String, String> _buildRequestHeader(Map<String, String>? headers) {
    var baseHeaders = _buildBaseRequestHeader(headers);
    baseHeaders[HttpHeaders.contentTypeHeader] = ContentType.json.mimeType;
    return baseHeaders;
  }

  String get endpoint;

  /// Endpoint regarding translating documents
  Documents get documents => _documents;

  /// Endpoint regarding translating text
  Glossaries get glossary => _glossary;

  /// Endpoint regardinng the user saved glossary
  Translations get translations => _translations;

  /// Endpoint regarding the supported languages
  Languages get languages => _languages;

  /// Endpoint regarding the quotas
  Quotas get quota => _quotas;
}

class _DeepLFreeApi extends DeepLApi {
  // _DeepLFreeApi(super.key, {super.client});
  _DeepLFreeApi(super.key, {super.client}) : super();

  @override
  String get endpoint => 'https://api-free.deepl.com/v$version';
}

class _DeepLProApi extends DeepLApi {
  _DeepLProApi(super.key, {super.client}) : super();

  @override
  String get endpoint => 'https://api.deepl.com/v$version';
}

typedef BodyHandler = Future<String> Function();
