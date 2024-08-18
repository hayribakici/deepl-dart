part of '../../deepl.dart';

class Glossary extends DeepLEndpoint {
  
  @override
  String get _path => 'glossary';

  Glossary(super.api);

    Future<List<LanguagePair>> supportedLanguagePairs() async {
      String json = await _api._get('glossary-language-pairs');
      return [];
    }

    Future<Glossary> create() async {
      return this;
    }
}