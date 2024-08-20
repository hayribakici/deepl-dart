// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '../deepl.dart';

abstract class DeepLApi {
  final int version = 2;
  late String _key;
  late http.Client _client;
  late Documents _documents;
  late Translations _translations;
  late Glossaries _glossary;
  late Languages _languages;
  late Quotas _quotas;

  DeepLApi(String key, {http.BaseClient? client}) {
    _key = key;
    _client = client ?? http.Client();

    _documents = Documents(this);
    _glossary = Glossaries(this);
    _translations = Translations(this);
    _languages = Languages(this);
    _quotas = Quotas(this);
  }

  Future<String> _get(String path, {Map<String, String>? headers}) async {
    return _handleResponse(await _client.get(Uri.parse('$endpoint/$path'),
        headers: _buildRequestHeader(headers)));
  }

  Future<String> _post(String path, String body,
      {Map<String, String>? headers}) async {
    var response = await _client.post(Uri.parse('$endpoint/$path'),
        headers: _buildRequestHeader(headers), body: body);
    return _handleResponse(response);
  }

  // ignore: unused_element
  Future<String> _postFormData(String urlPath, String filename) async {
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse('$endpoint/$urlPath'));
    request.files.add(http.MultipartFile.fromBytes(
        'deepl_document', File(filename).readAsBytesSync(),
        filename: filename.split('/').last));
    // FormData data = FormData();
    // HttpRequest request = HttpRequestUpload('POST', Uri.parse('$endpoint/$path'), )..
    // _client.send(request)
    // HttpRequest.request('/upload', method: 'POST', sendData: data).then((HttpRequest r) {
    // HttpRequestUpload
    // ...
// });
    // var response = await request.send();
    // return _handleResponse(response);
    return '';
  }

  Future<String> _handleResponse(http.Response response) async {
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode >= 400) {
      // TODO error handling
    }
    return responseBody;
  }

  Map<String, String> _buildRequestHeader(Map<String, String>? headers) {
    var base = {
      HttpHeaders.authorizationHeader: 'DeepL-Auth-Key $_key',
      HttpHeaders.contentTypeHeader: ContentType.json.mimeType
    };
    if (headers == null) {
      headers = base;
    } else {
      headers.addAll(base);
    }
    return headers;
  }

  String get endpoint;

  Documents get documents => _documents;
  Glossaries get glossary => _glossary;
  Translations get translations => _translations;
  Languages get languages => _languages;
  Quotas get quota => _quotas;
}

class DeepLFreeApi extends DeepLApi {
  DeepLFreeApi(super.key, {super.client});

  @override
  String get endpoint => 'https://api-free.deepl.com/v$version';
}

class DeepLProApi extends DeepLApi {
  DeepLProApi(super.key, {super.client}) {
    _glossary = Glossaries(this);
  }

  @override
  String get endpoint => 'https://api.deepl.com/v$version';
}
