// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Language _$LanguageFromJson(Map<String, dynamic> json) => Language(
      languageCode: $enumDecode(_$GlossaryLanguageEnumMap, json['language']),
      name: json['name'] as String,
      supportsFormality: json['supports_formality'] as bool? ?? false,
    );

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      'language': _$GlossaryLanguageEnumMap[instance.languageCode]!,
      'name': instance.name,
      'supports_formality': instance.supportsFormality,
    };

const _$GlossaryLanguageEnumMap = {
  GlossaryLanguage.da: 'da',
  GlossaryLanguage.de: 'de',
  GlossaryLanguage.en: 'en',
  GlossaryLanguage.es: 'es',
  GlossaryLanguage.fr: 'fr',
  GlossaryLanguage.it: 'it',
  GlossaryLanguage.ja: 'ja',
  GlossaryLanguage.ko: 'ko',
  GlossaryLanguage.nb: 'nb',
  GlossaryLanguage.nl: 'nl',
  GlossaryLanguage.pl: 'pl',
  GlossaryLanguage.pt: 'pt',
  GlossaryLanguage.ro: 'ro',
  GlossaryLanguage.ru: 'ru',
  GlossaryLanguage.sv: 'sv',
  GlossaryLanguage.zh: 'zh',
  GlossaryLanguage.unknown: 'unknown',
};

LanguagePair _$LanguagePairFromJson(Map<String, dynamic> json) => LanguagePair()
  ..source = $enumDecodeNullable(_$GlossaryLanguageEnumMap, json['source_lang'],
      unknownValue: GlossaryLanguage.unknown)
  ..target = $enumDecodeNullable(_$GlossaryLanguageEnumMap, json['target_lang'],
      unknownValue: GlossaryLanguage.unknown);

Quota _$QuotaFromJson(Map<String, dynamic> json) => Quota()
  ..characterCount = json['character_count'] as int? ?? 0
  ..characterLimit = json['character_limit'] as int? ?? 0;

Translation _$TranslationFromJson(Map<String, dynamic> json) => Translation()
  ..detectedLanguage = $enumDecodeNullable(
      _$GlossaryLanguageEnumMap, json['detected_source_language'],
      unknownValue: GlossaryLanguage.unknown)
  ..text = json['text'] as String?;

TranslationResponse _$TranslationResponseFromJson(Map<String, dynamic> json) =>
    TranslationResponse()
      ..translations = (json['translations'] as List<dynamic>?)
          ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
          .toList();

Glossary _$GlossaryFromJson(Map<String, dynamic> json) => Glossary()
  ..id = json['glossary_id'] as String?
  ..name = json['name'] as String?
  ..ready = json['ready'] as bool?
  ..sourceLanguage =
      $enumDecodeNullable(_$GlossaryLanguageEnumMap, json['source_lang'])
  ..targetLanguage =
      $enumDecodeNullable(_$GlossaryLanguageEnumMap, json['target_lang'])
  ..creationTime = json['creation_time'] == null
      ? null
      : DateTime.parse(json['creation_time'] as String)
  ..entryCount = json['entry_count'] as int?;
