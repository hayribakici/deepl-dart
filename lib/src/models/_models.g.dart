// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Language _$LanguageFromJson(Map<String, dynamic> json) => Language(
      languageCode: $enumDecode(_$LanguageCodeEnumMap, json['language']),
      name: json['name'] as String,
      supportsFormality: json['supports_formality'] as bool? ?? false,
    );

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      'language': _$LanguageCodeEnumMap[instance.languageCode]!,
      'name': instance.name,
      'supports_formality': instance.supportsFormality,
    };

const _$LanguageCodeEnumMap = {
  LanguageCode.AD: 'AD',
  LanguageCode.AE: 'AE',
  LanguageCode.AF: 'AF',
  LanguageCode.AG: 'AG',
  LanguageCode.AI: 'AI',
  LanguageCode.AL: 'AL',
  LanguageCode.AM: 'AM',
  LanguageCode.AO: 'AO',
  LanguageCode.AQ: 'AQ',
  LanguageCode.AR: 'AR',
  LanguageCode.AS: 'AS',
  LanguageCode.AT: 'AT',
  LanguageCode.AU: 'AU',
  LanguageCode.AW: 'AW',
  LanguageCode.AX: 'AX',
  LanguageCode.AZ: 'AZ',
  LanguageCode.BA: 'BA',
  LanguageCode.BB: 'BB',
  LanguageCode.BD: 'BD',
  LanguageCode.BE: 'BE',
  LanguageCode.BF: 'BF',
  LanguageCode.BG: 'BG',
  LanguageCode.BH: 'BH',
  LanguageCode.BI: 'BI',
  LanguageCode.BJ: 'BJ',
  LanguageCode.BL: 'BL',
  LanguageCode.BM: 'BM',
  LanguageCode.BN: 'BN',
  LanguageCode.BO: 'BO',
  LanguageCode.BQ: 'BQ',
  LanguageCode.BR: 'BR',
  LanguageCode.BS: 'BS',
  LanguageCode.BT: 'BT',
  LanguageCode.BV: 'BV',
  LanguageCode.BW: 'BW',
  LanguageCode.BY: 'BY',
  LanguageCode.BZ: 'BZ',
  LanguageCode.CA: 'CA',
  LanguageCode.CC: 'CC',
  LanguageCode.CD: 'CD',
  LanguageCode.CF: 'CF',
  LanguageCode.CG: 'CG',
  LanguageCode.CH: 'CH',
  LanguageCode.CI: 'CI',
  LanguageCode.CK: 'CK',
  LanguageCode.CL: 'CL',
  LanguageCode.CM: 'CM',
  LanguageCode.CN: 'CN',
  LanguageCode.CO: 'CO',
  LanguageCode.CR: 'CR',
  LanguageCode.CU: 'CU',
  LanguageCode.CV: 'CV',
  LanguageCode.CW: 'CW',
  LanguageCode.CX: 'CX',
  LanguageCode.CY: 'CY',
  LanguageCode.CZ: 'CZ',
  LanguageCode.DE: 'DE',
  LanguageCode.DJ: 'DJ',
  LanguageCode.DK: 'DK',
  LanguageCode.DM: 'DM',
  LanguageCode.DO: 'DO',
  LanguageCode.DZ: 'DZ',
  LanguageCode.EC: 'EC',
  LanguageCode.EE: 'EE',
  LanguageCode.EG: 'EG',
  LanguageCode.EH: 'EH',
  LanguageCode.ER: 'ER',
  LanguageCode.ES: 'ES',
  LanguageCode.ET: 'ET',
  LanguageCode.FI: 'FI',
  LanguageCode.FJ: 'FJ',
  LanguageCode.FK: 'FK',
  LanguageCode.FM: 'FM',
  LanguageCode.FO: 'FO',
  LanguageCode.FR: 'FR',
  LanguageCode.GA: 'GA',
  LanguageCode.GB: 'GB',
  LanguageCode.GD: 'GD',
  LanguageCode.GE: 'GE',
  LanguageCode.GF: 'GF',
  LanguageCode.GG: 'GG',
  LanguageCode.GH: 'GH',
  LanguageCode.GI: 'GI',
  LanguageCode.GL: 'GL',
  LanguageCode.GM: 'GM',
  LanguageCode.GN: 'GN',
  LanguageCode.GP: 'GP',
  LanguageCode.GQ: 'GQ',
  LanguageCode.GR: 'GR',
  LanguageCode.GS: 'GS',
  LanguageCode.GT: 'GT',
  LanguageCode.GU: 'GU',
  LanguageCode.GW: 'GW',
  LanguageCode.GY: 'GY',
  LanguageCode.HK: 'HK',
  LanguageCode.HM: 'HM',
  LanguageCode.HN: 'HN',
  LanguageCode.HR: 'HR',
  LanguageCode.HT: 'HT',
  LanguageCode.HU: 'HU',
  LanguageCode.ID: 'ID',
  LanguageCode.IE: 'IE',
  LanguageCode.IL: 'IL',
  LanguageCode.IM: 'IM',
  LanguageCode.IN: 'IN',
  LanguageCode.IO: 'IO',
  LanguageCode.IQ: 'IQ',
  LanguageCode.IR: 'IR',
  LanguageCode.IS: 'IS',
  LanguageCode.IT: 'IT',
  LanguageCode.JE: 'JE',
  LanguageCode.JM: 'JM',
  LanguageCode.JO: 'JO',
  LanguageCode.JP: 'JP',
  LanguageCode.KE: 'KE',
  LanguageCode.KG: 'KG',
  LanguageCode.KH: 'KH',
  LanguageCode.KI: 'KI',
  LanguageCode.KM: 'KM',
  LanguageCode.KN: 'KN',
  LanguageCode.KP: 'KP',
  LanguageCode.KR: 'KR',
  LanguageCode.KW: 'KW',
  LanguageCode.KY: 'KY',
  LanguageCode.KZ: 'KZ',
  LanguageCode.LA: 'LA',
  LanguageCode.LB: 'LB',
  LanguageCode.LC: 'LC',
  LanguageCode.LI: 'LI',
  LanguageCode.LK: 'LK',
  LanguageCode.LR: 'LR',
  LanguageCode.LS: 'LS',
  LanguageCode.LT: 'LT',
  LanguageCode.LU: 'LU',
  LanguageCode.LV: 'LV',
  LanguageCode.LY: 'LY',
  LanguageCode.MA: 'MA',
  LanguageCode.MC: 'MC',
  LanguageCode.MD: 'MD',
  LanguageCode.ME: 'ME',
  LanguageCode.MF: 'MF',
  LanguageCode.MG: 'MG',
  LanguageCode.MH: 'MH',
  LanguageCode.MK: 'MK',
  LanguageCode.ML: 'ML',
  LanguageCode.MM: 'MM',
  LanguageCode.MN: 'MN',
  LanguageCode.MO: 'MO',
  LanguageCode.MP: 'MP',
  LanguageCode.MQ: 'MQ',
  LanguageCode.MR: 'MR',
  LanguageCode.MS: 'MS',
  LanguageCode.MT: 'MT',
  LanguageCode.MU: 'MU',
  LanguageCode.MV: 'MV',
  LanguageCode.MW: 'MW',
  LanguageCode.MX: 'MX',
  LanguageCode.MY: 'MY',
  LanguageCode.MZ: 'MZ',
  LanguageCode.NA: 'NA',
  LanguageCode.NC: 'NC',
  LanguageCode.NE: 'NE',
  LanguageCode.NF: 'NF',
  LanguageCode.NG: 'NG',
  LanguageCode.NI: 'NI',
  LanguageCode.NL: 'NL',
  LanguageCode.NO: 'NO',
  LanguageCode.NP: 'NP',
  LanguageCode.NR: 'NR',
  LanguageCode.NU: 'NU',
  LanguageCode.NZ: 'NZ',
  LanguageCode.OM: 'OM',
  LanguageCode.PA: 'PA',
  LanguageCode.PE: 'PE',
  LanguageCode.PF: 'PF',
  LanguageCode.PG: 'PG',
  LanguageCode.PH: 'PH',
  LanguageCode.PK: 'PK',
  LanguageCode.PL: 'PL',
  LanguageCode.PM: 'PM',
  LanguageCode.PN: 'PN',
  LanguageCode.PR: 'PR',
  LanguageCode.PS: 'PS',
  LanguageCode.PT: 'PT',
  LanguageCode.PW: 'PW',
  LanguageCode.PY: 'PY',
  LanguageCode.QA: 'QA',
  LanguageCode.RE: 'RE',
  LanguageCode.RO: 'RO',
  LanguageCode.RS: 'RS',
  LanguageCode.RU: 'RU',
  LanguageCode.RW: 'RW',
  LanguageCode.SA: 'SA',
  LanguageCode.SB: 'SB',
  LanguageCode.SC: 'SC',
  LanguageCode.SD: 'SD',
  LanguageCode.SE: 'SE',
  LanguageCode.SG: 'SG',
  LanguageCode.SH: 'SH',
  LanguageCode.SI: 'SI',
  LanguageCode.SJ: 'SJ',
  LanguageCode.SK: 'SK',
  LanguageCode.SL: 'SL',
  LanguageCode.SM: 'SM',
  LanguageCode.SN: 'SN',
  LanguageCode.SO: 'SO',
  LanguageCode.SR: 'SR',
  LanguageCode.SS: 'SS',
  LanguageCode.ST: 'ST',
  LanguageCode.SV: 'SV',
  LanguageCode.SX: 'SX',
  LanguageCode.SY: 'SY',
  LanguageCode.SZ: 'SZ',
  LanguageCode.TC: 'TC',
  LanguageCode.TD: 'TD',
  LanguageCode.TF: 'TF',
  LanguageCode.TG: 'TG',
  LanguageCode.TH: 'TH',
  LanguageCode.TJ: 'TJ',
  LanguageCode.TK: 'TK',
  LanguageCode.TL: 'TL',
  LanguageCode.TM: 'TM',
  LanguageCode.TN: 'TN',
  LanguageCode.TO: 'TO',
  LanguageCode.TR: 'TR',
  LanguageCode.TT: 'TT',
  LanguageCode.TV: 'TV',
  LanguageCode.TW: 'TW',
  LanguageCode.TZ: 'TZ',
  LanguageCode.UA: 'UA',
  LanguageCode.UG: 'UG',
  LanguageCode.UM: 'UM',
  LanguageCode.US: 'US',
  LanguageCode.UY: 'UY',
  LanguageCode.UZ: 'UZ',
  LanguageCode.VA: 'VA',
  LanguageCode.VC: 'VC',
  LanguageCode.VE: 'VE',
  LanguageCode.VG: 'VG',
  LanguageCode.VI: 'VI',
  LanguageCode.VN: 'VN',
  LanguageCode.VU: 'VU',
  LanguageCode.WF: 'WF',
  LanguageCode.WS: 'WS',
  LanguageCode.XK: 'XK',
  LanguageCode.YE: 'YE',
  LanguageCode.YT: 'YT',
  LanguageCode.ZA: 'ZA',
  LanguageCode.ZM: 'ZM',
  LanguageCode.ZW: 'ZW',
  LanguageCode.unknown: 'unknown',
};

LanguagePair _$LanguagePairFromJson(Map<String, dynamic> json) => LanguagePair()
  ..source = $enumDecodeNullable(_$LanguageCodeEnumMap, json['source_lang'],
      unknownValue: LanguageCode.unknown)
  ..target = $enumDecodeNullable(_$LanguageCodeEnumMap, json['target_lang'],
      unknownValue: LanguageCode.unknown);

Quota _$QuotaFromJson(Map<String, dynamic> json) => Quota()
  ..characterCount = json['character_count'] as int? ?? 0
  ..characterLimit = json['character_limit'] as int? ?? 0;

Translation _$TranslationFromJson(Map<String, dynamic> json) => Translation()
  ..detectedLanguage = $enumDecodeNullable(
      _$LanguageCodeEnumMap, json['detected_source_language'],
      unknownValue: LanguageCode.unknown)
  ..text = json['text'] as String?;

TranslationResponse _$TranslationResponseFromJson(Map<String, dynamic> json) =>
    TranslationResponse()
      ..translations = (json['translations'] as List<dynamic>?)
          ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
          .toList();

Glossary _$GlossaryFromJson(Map<String, dynamic> json) => Glossary();
