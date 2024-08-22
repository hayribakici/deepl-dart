// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Language _$LanguageFromJson(Map<String, dynamic> json) => Language(
      languageCode: $enumDecode(_$SourceLanguageEnumMap, json['language']),
      name: json['name'] as String,
      supportsFormality: json['supports_formality'] as bool? ?? false,
    );

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      'language': _$SourceLanguageEnumMap[instance.languageCode]!,
      'name': instance.name,
      'supports_formality': instance.supportsFormality,
    };

const _$SourceLanguageEnumMap = {
  SourceLanguage.BG: 'BG',
  SourceLanguage.CS: 'CS',
  SourceLanguage.DA: 'DA',
  SourceLanguage.DE: 'DE',
  SourceLanguage.EL: 'EL',
  SourceLanguage.EN: 'EN',
  SourceLanguage.ES: 'ES',
  SourceLanguage.ET: 'ET',
  SourceLanguage.FI: 'FI',
  SourceLanguage.FR: 'FR',
  SourceLanguage.HU: 'HU',
  SourceLanguage.ID: 'ID',
  SourceLanguage.IT: 'IT',
  SourceLanguage.JA: 'JA',
  SourceLanguage.KO: 'KO',
  SourceLanguage.LT: 'LT',
  SourceLanguage.LV: 'LV',
  SourceLanguage.NB: 'NB',
  SourceLanguage.NL: 'NL',
  SourceLanguage.PL: 'PL',
  SourceLanguage.PT: 'PT',
  SourceLanguage.RO: 'RO',
  SourceLanguage.RU: 'RU',
  SourceLanguage.SK: 'SK',
  SourceLanguage.SL: 'SL',
  SourceLanguage.SV: 'SV',
  SourceLanguage.TR: 'TR',
  SourceLanguage.UK: 'UK',
  SourceLanguage.ZH: 'ZH',
  SourceLanguage.unknown: 'unknown',
};

LanguagePair _$LanguagePairFromJson(Map<String, dynamic> json) => LanguagePair()
  ..source = $enumDecodeNullable(_$GlossaryLanguageEnumMap, json['source_lang'],
      unknownValue: GlossaryLanguage.unknown)
  ..target = $enumDecodeNullable(_$GlossaryLanguageEnumMap, json['target_lang'],
      unknownValue: GlossaryLanguage.unknown);

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

Quota _$QuotaFromJson(Map<String, dynamic> json) => Quota()
  ..characterCount = json['character_count'] as int? ?? 0
  ..characterLimit = json['character_limit'] as int? ?? 0;

Translation _$TranslationFromJson(Map<String, dynamic> json) => Translation()
  ..detectedLanguage = $enumDecodeNullable(
      _$SourceLanguageEnumMap, json['detected_source_language'],
      unknownValue: SourceLanguage.unknown)
  ..text = json['text'] as String?;

TranslateTextRequestOptions _$TranslateTextRequestOptionsFromJson(
        Map<String, dynamic> json) =>
    TranslateTextRequestOptions()
      ..source =
          $enumDecodeNullable(_$SourceLanguageEnumMap, json['source_lang'])
      ..formality = $enumDecode(_$FormalityEnumMap, json['formality'])
      ..glossaryId = json['glossary_id'] as String?
      ..context = json['context'] as String?
      ..splitSentenceOption = $enumDecode(
          _$SplitSentenceOptionEnumMap, json['split_sentence_option'])
      ..preserveFormatting = json['preserve_formatting'] as bool;

Map<String, dynamic> _$TranslateTextRequestOptionsToJson(
        TranslateTextRequestOptions instance) =>
    <String, dynamic>{
      'source_lang': _$SourceLanguageEnumMap[instance.source],
      'formality': _$FormalityEnumMap[instance.formality]!,
      'glossary_id': instance.glossaryId,
      'context': instance.context,
      'split_sentence_option':
          _$SplitSentenceOptionEnumMap[instance.splitSentenceOption]!,
      'preserve_formatting': instance.preserveFormatting,
    };

const _$FormalityEnumMap = {
  Formality.def: 'def',
  Formality.more: 'more',
  Formality.less: 'less',
  Formality.preferMore: 'preferMore',
  Formality.preferLess: 'preferLess',
};

const _$SplitSentenceOptionEnumMap = {
  SplitSentenceOption.keep: 'keep',
  SplitSentenceOption.punctuation: 'punctuation',
  SplitSentenceOption.all: 'all',
};

TranslateDocumentRequestOptions _$TranslateDocumentRequestOptionsFromJson(
        Map<String, dynamic> json) =>
    TranslateDocumentRequestOptions()
      ..source =
          $enumDecodeNullable(_$SourceLanguageEnumMap, json['source_lang'])
      ..formality = $enumDecode(_$FormalityEnumMap, json['formality'])
      ..glossaryId = json['glossary_id'] as String?
      ..outputFormat = $enumDecodeNullable(
          _$SupportetFileTypesEnumMap, json['output_format']);

Map<String, dynamic> _$TranslateDocumentRequestOptionsToJson(
        TranslateDocumentRequestOptions instance) =>
    <String, dynamic>{
      'source_lang': _$SourceLanguageEnumMap[instance.source],
      'formality': _$FormalityEnumMap[instance.formality]!,
      'glossary_id': instance.glossaryId,
      'output_format': _$SupportetFileTypesEnumMap[instance.outputFormat],
    };

const _$SupportetFileTypesEnumMap = {
  SupportetFileTypes.docx: 'docx',
  SupportetFileTypes.pptx: 'pptx',
  SupportetFileTypes.xlsx: 'xlsx',
  SupportetFileTypes.pdf: 'pdf',
  SupportetFileTypes.htm: 'htm',
  SupportetFileTypes.html: 'html',
  SupportetFileTypes.txt: 'txt',
  SupportetFileTypes.xlf: 'xlf',
  SupportetFileTypes.srt: 'srt',
};

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

DocumentStatus _$DocumentStatusFromJson(Map<String, dynamic> json) =>
    DocumentStatus()
      ..documentId = json['document_id'] as String?
      ..translationStatus =
          $enumDecodeNullable(_$TranslationStatusEnumMap, json['status'])
      ..billedCharacters = json['billed_characters'] as int?
      ..errorMessage = json['error_message'] as String?;

const _$TranslationStatusEnumMap = {
  TranslationStatus.queued: 'queued',
  TranslationStatus.translating: 'translating',
  TranslationStatus.done: 'done',
  TranslationStatus.error: 'error',
};

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      json['document_id'] as String,
      json['document_key'] as String,
    );

DeepLError _$DeepLErrorFromJson(Map<String, dynamic> json) =>
    DeepLError()..message = json['title'] as String?;
