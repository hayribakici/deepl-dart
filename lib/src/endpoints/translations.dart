part of '../../deepl.dart';

class Translations extends DeepLEndpoint {
  @override
  String get _path => 'translate';

  Translations(super.api);

  /// Translates text
  Future<Iterable<Translation>> translateText(String text,
      {required TargetLanguage target,
      TranslateRequestOptions? options}) async {
    String jsonString = await _post(_path, jsonEncode(options?.toJson()));
    var tJson = jsonDecode(jsonString)['translations'] as Iterable<dynamic>;
    return tJson.map((json) => Translation.fromJson(json));
  }


  Future<DocumentStatus> translateDocument() async {
    var document = await _api.documents.uploadDocument();
    return _api.documents.status(document.documentId, document.documentKey);
  }


}
