part of '../../deepl.dart';

class Translations extends DeepLEndpoint {

  @override
  String get _path => 'translate';

  Translations(super.api);

  Future<Iterable<Translation>> translate({required String text, required TargetLanguage target, SourceLanguage? source, String? context,
  SplitSentenceOption splitSentenceOption = SplitSentenceOption.keep, bool preserveFormatting = false, Formality formality = Formality.default, String? glossaryId, }) async {
    String jsonString = await _api._get(_path);
    var tJson = jsonDecode(jsonString)['translaations'] as Iterable<dynamic>;
    return tJson.map((json) => Translation.fromJson(json));
  }
  
}
/// Sets whether the translation engine should first split 
/// the input into sentences.Sets whether the translation 
/// engine should first split the input into sentences.
enum SplitSentenceOption {
  /// no splitting at all, whole input is treated as one sentence
  keep,

  /// nonewlines (default when tag_handling=html) - splits on punctuation only, ignoring newlines
  punctuation,

  /// (default when tag_handling is not set to html) - splits on punctuation and on newlines
  all
}

enum Formality {
  default,
  more('more'),
  less('less'),
  preferMore('prefer_more'),
  preferLess(name: 'prefer_less')

  const Formality({required name: this.apiName});

  final String apiName;
}