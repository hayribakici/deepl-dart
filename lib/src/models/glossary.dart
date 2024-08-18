part of '_models.dart';

@JsonSerializable(createToJson: false)
class Glossaries {

  Glossaries();

  @JsonKey(name: 'supported_languages')
  List<LanguagePair>? supportedLanguages;

  factory Glossaries.fromJson(Map<String, dynamic> json) => _$GlossariesFromJson(json);
}


