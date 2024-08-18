part of '../deepl.dart';

abstract class DeepLApi {
  final int version = 2;
  late http.Client _client;
  late Documents _documents;
  late Glossary _glossary;

  DeepLApi([http.BaseClient? client]) {
    _client = client ?? http.Client();

    _documents = Documents(this);
    _glossary = Glossary(this);
  }

  Future<String> _get(String path, [Map<String, String>? headers]) async {
    return _handleResponse(await _client.get(Uri.parse('$endpoint/$path'),
        headers: _buildRequestHeader(headers)));
  }

  Future<String> _post(
      String path, Map<String, String> headers, String body) async {
    _client.post(Uri.parse('$endpoint/$path'),
        headers: _buildRequestHeader(headers), body: body);
    return '';
  }

  Future<String> _handleResponse(http.Response response) async {
    // (await response).
    return utf8.decode(response.bodyBytes);
  }

  Map<String, String> _buildRequestHeader([Map<String, String>? headers]) {
    var base = {
      'Authorization': 'DeepL-Auth-Key ${Env.deeplApiKey}',
      'Content-Type': 'application/json'
    };
    if (headers == null) {
      headers = base;
    } else {
      headers.addAll(base);
    }
    // headers == null ? base : headers.addAll(base);

    return headers;
  }

  String get endpoint;

  Documents get documents => _documents;
  Glossary get glossary => _glossary;
}

class DeepLFreeApi extends DeepLApi {
  DeepLFreeApi([super.client]);

  @override
  String get endpoint => 'https://api-free.deepl.com/v$version';
}

class DeepLProApi extends DeepLApi {
  late Glossary _glossary;

  DeepLProApi([super.client]) {
    _glossary = Glossary(this);
  }

  @override
  String get endpoint => 'https://api.deepl.com/v$version';

  Glossary get glossary => _glossary;
}
