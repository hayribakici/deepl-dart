
part of '../deepl.dart';

abstract class DeepLApi {
  final int version = 2;
  late http.Client _client;
  late Documents _documents;

  DeepLApi(String key, String secret, [http.BaseClient? client]) {
    _client = client ?? http.Client();

    _documents = Documents(this);
  }

  

  Future<String> _get(String path, [Map<String, String>? headers]) async {
    _client.get(Uri.parse('$endpoint/$path'), headers: headers);
    return '';
  }

  Future<String> _post(String path, Map<String, String> headers, String body) async {
    _client.post(Uri.parse('$endpoint/$path'), headers: headers, body: body);
    return '';
  }

  Future<String> _handleResponse(Future<http.Response> response) async {
    // (await response).
    return '';
  }



  String get endpoint;

  Documents get documents => _documents;

  
}

class DeepLFreeApi extends DeepLApi {
  DeepLFreeApi(super.key, super.secret, [super.client]);

  
  @override
  String get endpoint => 'https://api-free.deepl.com/v$version';
}

class DeepLProApi extends DeepLApi {

  late Glossary _glossary;

  DeepLProApi(super.key, super.secret, [super.client]) {
    _glossary = Glossary(this);  
  }

  @override
  String get endpoint => 'https://api.deepl.com/v$version';

  Glossary get glossary => _glossary;
}