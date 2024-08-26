// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '_models.dart';

/// Model class for the glossary API.
@JsonSerializable(createToJson: false)
class Glossary {
  Glossary();

  /// A unique ID assigned to the glossary.
  @JsonKey(name: 'glossary_id')
  String? id;

  /// Name of the glossary.
  String? name;

  /// Whether the newly created glossary can already be used in [Translations.translateText] requests.
  ///
  /// If the created glossary is not yet ready, you have to wait and check the ready status
  /// of the glossary before using it in a [Translations.translateText] request.
  bool? ready;

  @JsonKey(name: 'source_lang')
  GlossaryLanguage? sourceLanguage;

  @JsonKey(name: 'target_lang')
  GlossaryLanguage? targetLanguage;

  @JsonKey(name: 'creation_time')
  DateTime? creationTime;

  @JsonKey(name: 'entry_count')
  int? entryCount;

  factory Glossary.fromJson(Map<String, dynamic> json) =>
      _$GlossaryFromJson(json);
}

/// Supported [Glossary] Languages
enum GlossaryLanguage {
  da,
  de,
  en,
  es,
  fr,
  it,
  ja,
  ko,
  nb,
  nl,
  pl,
  pt,
  ro,
  ru,
  sv,
  zh,
  unknown
}

/// The format in which the glossary entries are provided.
@JsonEnum(valueField: 'formatValue')
enum GlossaryFormat {
  /// Tab separated Values
  tsv(formatValue: '\t'),
  // Comma separated values
  csv(formatValue: ',');

  const GlossaryFormat({required this.formatValue});

  final String formatValue;
}
