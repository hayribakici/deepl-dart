part of '_models.dart';

@JsonSerializable(createToJson: false)
class Translation {
  Translation();
  
  factory Translation.fromJson(Map<String, dynamic> json) =>
      _$TranslationFromJson(json);

  @JsonKey(
      name: 'detected_source_language', unknownEnumValue: LanguageCode.unknown)
  LanguageCode? detectedLanguage;

  @JsonKey(name: 'text')
  String? text;
}
