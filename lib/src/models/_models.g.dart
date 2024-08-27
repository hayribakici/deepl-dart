// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Language _$LanguageFromJson(Map<String, dynamic> json) => Language(
      sourceLang: $enumDecode(_$SourceLanguageEnumMap, json['language']),
      name: json['name'] as String,
      supportsFormality: json['supports_formality'] as bool? ?? false,
    );

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      'language': _$SourceLanguageEnumMap[instance.sourceLang]!,
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
      ..target = $enumDecode(_$TargetLanguageEnumMap, json['target_lang'])
      ..formality = $enumDecode(_$FormalityEnumMap, json['formality'])
      ..glossaryId = json['glossary_id'] as String?
      ..text = (json['text'] as List<dynamic>).map((e) => e as String).toList()
      ..context = json['context'] as String?
      ..splitSentenceOption = $enumDecode(
          _$SplitSentenceOptionEnumMap, json['split_sentence_option'])
      ..preserveFormatting = json['preserve_formatting'] as bool;

Map<String, dynamic> _$TranslateTextRequestOptionsToJson(
    TranslateTextRequestOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('source_lang', _$SourceLanguageEnumMap[instance.source]);
  val['target_lang'] = _$TargetLanguageEnumMap[instance.target]!;
  val['formality'] = _$FormalityEnumMap[instance.formality]!;
  writeNotNull('glossary_id', instance.glossaryId);
  val['text'] = instance.text;
  val['context'] = instance.context;
  val['split_sentence_option'] =
      _$SplitSentenceOptionEnumMap[instance.splitSentenceOption]!;
  val['preserve_formatting'] = instance.preserveFormatting;
  return val;
}

const _$TargetLanguageEnumMap = {
  TargetLanguage.AR: 'AR',
  TargetLanguage.BG: 'BG',
  TargetLanguage.CS: 'CS',
  TargetLanguage.DA: 'DA',
  TargetLanguage.DE: 'DE',
  TargetLanguage.EL: 'EL',
  TargetLanguage.EN_GB: 'EN_GB',
  TargetLanguage.EN_US: 'EN_US',
  TargetLanguage.ES: 'ES',
  TargetLanguage.ET: 'ET',
  TargetLanguage.FI: 'FI',
  TargetLanguage.FR: 'FR',
  TargetLanguage.HU: 'HU',
  TargetLanguage.ID: 'ID',
  TargetLanguage.IT: 'IT',
  TargetLanguage.JA: 'JA',
  TargetLanguage.KO: 'KO',
  TargetLanguage.LT: 'LT',
  TargetLanguage.LV: 'LV',
  TargetLanguage.NB: 'NB',
  TargetLanguage.NL: 'NL',
  TargetLanguage.PL: 'PL',
  TargetLanguage.PT_BR: 'PT_BR',
  TargetLanguage.PT_PT: 'PT_PT',
  TargetLanguage.RO: 'RO',
  TargetLanguage.RU: 'RU',
  TargetLanguage.SK: 'SK',
  TargetLanguage.SL: 'SL',
  TargetLanguage.SV: 'SV',
  TargetLanguage.TR: 'TR',
  TargetLanguage.UK: 'UK',
  TargetLanguage.ZH: 'ZH',
  TargetLanguage.ZH_HANS: 'ZH_HANS',
  TargetLanguage.ZH_HANT: 'ZH_HANT',
  TargetLanguage.unknown: 'unknown',
};

const _$FormalityEnumMap = {
  Formality.def: 'default',
  Formality.more: 'more',
  Formality.less: 'less',
  Formality.preferMore: 'prefer_more',
  Formality.preferLess: 'prefer_less',
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
      ..target = $enumDecode(_$TargetLanguageEnumMap, json['target_lang'])
      ..formality = $enumDecode(_$FormalityEnumMap, json['formality'])
      ..glossaryId = json['glossary_id'] as String?
      ..filename = json['filename'] as String
      ..outputFormat = $enumDecodeNullable(
          _$SupportetFileTypesEnumMap, json['output_format']);

Map<String, dynamic> _$TranslateDocumentRequestOptionsToJson(
    TranslateDocumentRequestOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('source_lang', _$SourceLanguageEnumMap[instance.source]);
  val['target_lang'] = _$TargetLanguageEnumMap[instance.target]!;
  val['formality'] = _$FormalityEnumMap[instance.formality]!;
  writeNotNull('glossary_id', instance.glossaryId);
  val['filename'] = instance.filename;
  writeNotNull(
      'output_format', _$SupportetFileTypesEnumMap[instance.outputFormat]);
  return val;
}

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
      ..secondsRemaining = json['seconds_remaining'] as int?
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
    DeepLError()..message = json['message'] as String?;
