import 'dart:io';

import 'package:deepl_dart/deepl.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

class DeepLMockApi extends DeepLApi {
  factory DeepLMockApi.create() {
    // var httpClient = InterceptedClient.build(
    // interceptors: [DeepLApiInterceptor()], client: MockClient());
    return DeepLMockApi("", client: MockClient(handleRequest));
  }

  DeepLMockApi(super.key, {super.client});

  @override
  String get endpoint => 'test/data/v$version';
}

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


// class DeepLApiInterceptor implements InterceptorContract {
//   @override
//   Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
//     return request;
//   }

//   @override
//   Future<BaseResponse> interceptResponse({required BaseResponse response}) {
//     // TODO: implement interceptResponse
//     throw UnimplementedError();
//   }

//   @override
//   Future<bool> shouldInterceptRequest() async => true;

//   @override
//   Future<bool> shouldInterceptResponse() async => false;
// }
