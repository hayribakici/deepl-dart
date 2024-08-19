// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '_models.dart';

@JsonSerializable(createToJson: false)
class Translation {
  Translation();
  
  factory Translation.fromJson(Map<String, dynamic> json) =>
      _$TranslationFromJson(json);

  @JsonKey(
      name: 'detected_source_language', unknownEnumValue: SourceLanguage.unknown)
  SourceLanguage? detectedLanguage;

  @JsonKey(name: 'text')
  String? text;
}

@JsonSerializable()
class TranslateRequestOptions {

  TranslateRequestOptions();

  @JsonKey(name: 'source_lang')
  SourceLanguage? source;

  String? context;

  @JsonKey(name: 'split_sentence_option')
  SplitSentenceOption splitSentenceOption = SplitSentenceOption.keep;

  @JsonKey(name: 'preserve_formatting')
  bool preserveFormatting = false;

  
  Formality formality = Formality.def;

  @JsonKey(name: 'glossary_id')
  String? glossaryId;

  Map<String, dynamic> toJson() => _$TranslateRequestOptionsToJson(this);

  TranslateRequestOptions._builder(TranslateRequestOptionsBuilder builder) {
    source = builder.source;
    context = builder.context;
    preserveFormatting = builder.preserveFormatting;
    formality = builder.formality;
    glossaryId = builder.glossaryId;
  }
}

final class TranslateRequestOptionsBuilder {
  SourceLanguage? source;
  String? context;

  SplitSentenceOption splitSentenceOption = SplitSentenceOption.keep;
  bool preserveFormatting = false;
  Formality formality = Formality.def;
  String? glossaryId;

  TranslateRequestOptions build() => TranslateRequestOptions._builder(this);
}

/// Sets whether the translation engine should first split
/// the input into sentences.Sets whether the translation
/// engine should first split the input into sentences.
enum SplitSentenceOption {
  /// no splitting at all, whole input is treated as one sentence
  keep,

  /// nonewlines (default when tag_handling=html) - splits on punctuation only, ignoring newlines
  punctuation,

  /// (default when tag_handling is not set to html) - splits on punctuation and on newlines
  all
}

enum Formality {
  /// default
  def(apiName: 'default'),

  /// more
  more(apiName: 'more'),

  /// less
  less(apiName: 'less'),

  /// prefer more
  preferMore(apiName: 'prefer_more'),

  /// prefer less
  preferLess(apiName: 'prefer_less');

  const Formality({required this.apiName});

  final String apiName;
}