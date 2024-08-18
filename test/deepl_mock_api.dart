import 'dart:io';

import 'package:deepl_dart/deepl.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:http_interceptor/http/http_methods.dart';
import 'package:http_interceptor/http_interceptor.dart';

class DeepLMockApi extends DeepLApi {
  factory DeepLMockApi.create() {
    var httpClient = InterceptedClient.build(
    interceptors: [DeepLApiInterceptor()], client: MockClient());
    return DeepLMockApi("", client: MockClient(handleRequest));
  }

  DeepLMockApi(super.key, {super.client});

  @override
  String get endpoint => 'test/data/v$version';

  
}

typedef IntercepHandler = void Function(HttpMethod method, Uri url, Map<String, String>? headers, [String? body]);

Future<http.Response> handleRequest(http.BaseRequest request) async {
  return createSuccessResponse(_readResponseContent(request.url));
}

String _readResponseContent(Uri url) {
  // var partialPath = _readPath(url);
  var file = File('$url.json');
  return file.readAsStringSync();
}

http.Response createSuccessResponse([String body = ""]) {
  /// necessary due to using Latin-1 encoding per default.
  /// https://stackoverflow.com/questions/52990816/dart-json-encodedata-can-not-accept-other-language
  return http.Response(body, HttpStatus.ok, headers: {
    HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
  });
}


class DeepLApiInterceptor implements InterceptorContract {
  
  final IntercepHandler? _handler;

  DeepLApiInterceptor(this._handler);
  
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    if (_handler != null) {
      _handler(HttpMethod.values.firstWhere((element) => element.name == request.method), request.url, request.headers);
    }
    return request;
  }


  @override
  Future<BaseResponse> interceptResponse({required BaseResponse response}) async {
    return response;
  }

  @override
  Future<bool> shouldInterceptRequest() async => true;

  @override
  Future<bool> shouldInterceptResponse() async => false;
}
