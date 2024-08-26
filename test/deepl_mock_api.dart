import 'dart:convert';
import 'dart:io';

import 'package:deepl/deepl.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

class DeepLMockApi extends DeepLApi {
  factory DeepLMockApi.create() =>
      DeepLMockApi('key', client: MockClient(handleRequest));

  factory DeepLMockApi.streaming() =>
      DeepLMockApi('key', client: MockClient.streaming(handleStreamingRequest));

  DeepLMockApi(super.key, {super.client});

  @override
  String get endpoint => 'test/data/v$version';
}

IntercepHandler? _handler;
set interceptor(IntercepHandler? value) => _handler = value;

typedef IntercepHandler = void Function(
    String method, Uri url, Map<String, String>? headers,
    [String? body]);

Future<http.StreamedResponse> handleStreamingRequest(
    http.BaseRequest request, http.ByteStream bodyStream) async {
  if (_handler != null) {
    _handler!(
      request.method,
      request.url,
      request.headers,
      await bodyStream.bytesToString(),
    );
  }
  return http.StreamedResponse(
    Stream.value(utf8.encode(_readResponseContent(request.url))),
    HttpStatus.ok,
  );
}

Future<http.Response> handleRequest(http.Request request) async {
  if (_handler != null) {
    _handler!(request.method, request.url, request.headers, request.body);
  }
  return createSuccessResponse(_readResponseContent(request.url));
}

String _readResponseContent(Uri url) => File('$url.json').readAsStringSync();

http.Response createSuccessResponse([String body = ""]) {
  /// necessary due to using Latin-1 encoding per default.
  /// https://stackoverflow.com/questions/52990816/dart-json-encodedata-can-not-accept-other-language
  return http.Response(body, HttpStatus.ok, headers: {
    HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
  });
}
