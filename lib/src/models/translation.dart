// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '_models.dart';

@JsonSerializable(createToJson: false)
class Translation {
  Translation();

  factory Translation.fromJson(Map<String, dynamic> json) =>
      _$TranslationFromJson(json);

  @JsonKey(
      name: 'detected_source_language',
      unknownEnumValue: SourceLanguage.unknown)
  SourceLanguage? detectedLanguage;

  @JsonKey(name: 'text')
  String? text;
}

/// Base class for emitting translations
abstract class TranslateRequestOptions {
  @JsonKey(name: 'source_lang')
  SourceLanguage? source;

  Formality formality = Formality.def;

  @JsonKey(name: 'glossary_id')
  String? glossaryId;
}

/// Options for calling [Translations.translateText].
@JsonSerializable()
final class TranslateTextRequestOptions extends TranslateRequestOptions {
  TranslateTextRequestOptions();

  String? context;

  @JsonKey(name: 'split_sentence_option')
  SplitSentenceOption splitSentenceOption = SplitSentenceOption.keep;

  @JsonKey(name: 'preserve_formatting')
  bool preserveFormatting = false;

  Map<String, dynamic> toJson() => _$TranslateTextRequestOptionsToJson(this);

  factory TranslateTextRequestOptions.fromJson(Map<String, dynamic> json) =>
      _$TranslateTextRequestOptionsFromJson(json);

  TranslateTextRequestOptions._builder(
      TranslateTextRequestOptionsBuilder builder) {
    source = builder.source;
    context = builder.context;
    preserveFormatting = builder.preserveFormatting;
    formality = builder.formality;
    glossaryId = builder.glossaryId;
  }
}

abstract class TranslateRequestBuilder<T> {
  SourceLanguage? source;

  Formality formality = Formality.def;
  String? glossaryId;

  T build();
}

/// Builder class for [TranslateTextRequestOptions]
final class TranslateTextRequestOptionsBuilder
    extends TranslateRequestBuilder<TranslateTextRequestOptions> {
  String? context;

  SplitSentenceOption splitSentenceOption = SplitSentenceOption.keep;
  bool preserveFormatting = false;

  @override
  TranslateTextRequestOptions build() =>
      TranslateTextRequestOptions._builder(this);
}

/// Options for calling [Translations.translateDocument].
@JsonSerializable()
final class TranslateDocumentRequestOptions extends TranslateRequestOptions {
  TranslateDocumentRequestOptions();

  @JsonKey(name: 'output_format')
  SupportetFileTypes? outputFormat;

  Map<String, dynamic> toJson() =>
      _$TranslateDocumentRequestOptionsToJson(this);

  factory TranslateDocumentRequestOptions.fromJson(Map<String, dynamic> json) =>
      _$TranslateDocumentRequestOptionsFromJson(json);

  TranslateDocumentRequestOptions._builder(
      TranslateDocumentRequestOptionsBuilder builder) {
    source = builder.source;
    outputFormat = builder.outputFormat;
    formality = builder.formality;
    glossaryId = builder.glossaryId;
  }
}

final class TranslateDocumentRequestOptionsBuilder
    extends TranslateRequestBuilder<TranslateDocumentRequestOptions> {
  SupportetFileTypes? outputFormat;

  @override
  TranslateDocumentRequestOptions build() =>
      TranslateDocumentRequestOptions._builder(this);
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

enum SupportetFileTypes {
  docx, // - Microsoft Word Document

  pptx, // - Microsoft PowerPoint Document

  xlsx, // - Microsoft Excel Document

  pdf, // - Portable Document Format

  htm,

  html, // - HTML Document

  txt, // - Plain Text Document

  xlf, // / xliff - XLIFF Document, version 2.1

  srt, //
}
