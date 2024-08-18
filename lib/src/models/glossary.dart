// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '_models.dart';

/// 
@JsonSerializable(createToJson: false)
class Glossary {

  Glossary();

  @JsonKey(name: 'glossary_id')
  String? id;

  String? name;

  bool? ready;

  @JsonKey(name: 'source_lang')
  GlossaryLanguage? sourceLanguage;

  @JsonKey(name: 'target_lang')
  GlossaryLanguage? targetLanguage;

  @JsonKey(name: 'creation_time')
  DateTime? creationTime;

  @JsonKey(name: 'entry_count')
  int? entryCount;


  factory Glossary.fromJson(Map<String, dynamic> json) => _$GlossaryFromJson(json);
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
enum GlossaryFormat {
  tsv(formatValue: '\t'), // tab separated values
  csv(formatValue: ','); // comma separated values

  // final String value;
  const GlossaryFormat({required this.formatValue});

  final String formatValue;
}