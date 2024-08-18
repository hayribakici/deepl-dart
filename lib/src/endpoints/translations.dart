part of '../../deepl.dart';

class Translations extends DeepLEndpoint {

  @override
  String get _path => 'translate';

  Translations(super.api);

  Future<Translation> translate(String text, {required TargetLanguage target, SourceLanguage? source}) async {
    return Translation();
  }
  
}