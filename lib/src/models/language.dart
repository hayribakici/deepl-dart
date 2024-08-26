// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// ignore_for_file: constant_identifier_names

part of '_models.dart';

/// Model class that represents the Language API.
@JsonSerializable()
class Language {
  /// The language code
  @JsonKey(name: 'language')
  SourceLanguage sourceLang;

  /// Name of the language
  String name;

  /// Whether or not formality is supportedd
  @JsonKey(name: 'supports_formality')
  bool supportsFormality;

  Language(
      {required this.sourceLang,
      required this.name,
      this.supportsFormality = false});

  Map<String, dynamic> toJson() => _$LanguageToJson(this);

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);
}

/// Model class that holds two [GlossaryLanguage] instances. Used in [Glossaries.supportedLanguagePairs]
@JsonSerializable(createToJson: false)
class LanguagePair {
  LanguagePair();

  /// Creates an instance with
  factory LanguagePair.create(
      GlossaryLanguage source, GlossaryLanguage target) {
    return LanguagePair()
      ..source = source
      ..target = target;
  }

  @JsonKey(name: 'source_lang', unknownEnumValue: GlossaryLanguage.unknown)
  GlossaryLanguage? source;
  @JsonKey(name: 'target_lang', unknownEnumValue: GlossaryLanguage.unknown)
  GlossaryLanguage? target;

  factory LanguagePair.fromJson(Map<String, dynamic> json) =>
      _$LanguagePairFromJson(json);
}

/// Enum for source languages
enum SourceLanguage {
  BG,
  CS,
  DA,
  DE,
  EL,
  EN,
  ES,
  ET,
  FI,
  FR,
  HU,
  ID,
  IT,
  JA,
  KO,
  LT,
  LV,
  NB,
  NL,
  PL,
  PT,
  RO,
  RU,
  SK,
  SL,
  SV,
  TR,
  UK,
  ZH,
  unknown
}

/// Enum for target tranlation language
enum TargetLanguage {
  AR,
  BG,
  CS,
  DA,
  DE,
  EL,
  EN_GB,
  EN_US,
  ES,
  ET,
  FI,
  FR,
  HU,
  ID,
  IT,
  JA,
  KO,
  LT,
  LV,
  NB,
  NL,
  PL,
  PT_BR,
  PT_PT,
  RO,
  RU,
  SK,
  SL,
  SV,
  TR,
  UK,
  ZH,
  ZH_HANS,
  ZH_HANT,
  unknown
}
