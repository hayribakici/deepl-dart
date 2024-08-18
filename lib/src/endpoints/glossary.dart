part of '../../deepl.dart';

class Glossary extends DeepLEndpoint {
  @override
  String get _path => 'glossary';

  Glossary(super.api);

  Future<Iterable<LanguagePair>> supportedLanguagePairs() async {
    String jsonString = await _api._get('glossary-language-pairs');
    // print(jsonString);
    var tJson = jsonDecode(jsonString)['supported_languages'] as Iterable<dynamic>;
    return tJson.map((json) => LanguagePair.fromJson(json));
  }

  Future<Glossary> create() async {
    return this;
  }
}
