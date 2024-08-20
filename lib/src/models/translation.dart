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

/// Options for calling [Translations.translateText].
@JsonSerializable()
final class TranslateRequestOptions {

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

  factory TranslateRequestOptions.fromJson(Map<String, dynamic> json) => _$TranslateRequestOptionsFromJson(json);

  TranslateRequestOptions._builder(TranslateRequestOptionsBuilder builder) {
    source = builder.source;
    context = builder.context;
    preserveFormatting = builder.preserveFormatting;
    formality = builder.formality;
    glossaryId = builder.glossaryId;
  }
}

/// Builder class for [TranslateRequestOptions]
final class TranslateRequestOptionsBuilder {
  SourceLanguage? source;
  String? context;

  SplitSentenceOption splitSentenceOption = SplitSentenceOption.keep;
  bool preserveFormatting = false;
  Formality formality = Formality.def;
  String? glossaryId;

  TranslateRequestOptions build() => TranslateRequestOptions._builder(this);
}

/// Options whether to first split the input into sentences.
enum SplitSentenceOption {
  /// No splitting at all.
  /// 
  /// The whole input is treated as one sentence
  keep,

  /// Splitting punctuation only, ignoring newlines (default when tag_handling=html)
  punctuation,

  /// Splitting punctuation and newlines (default when tag_handling is not set to html)
  all
}

/// 
enum Formality {
  /// Default formality
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