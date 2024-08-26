// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '_models.dart';

/// Model class that represents a translation made by the
/// translation engine.
@JsonSerializable(createToJson: false)
class Translation {
  Translation();

  factory Translation.fromJson(Map<String, dynamic> json) =>
      _$TranslationFromJson(json);

  /// The detected source language
  @JsonKey(
      name: 'detected_source_language',
      unknownEnumValue: SourceLanguage.unknown)
  SourceLanguage? detectedLanguage;

  /// The translated text
  @JsonKey(name: 'text')
  String? text;
}

/// Base class for emitting translations
abstract class TranslateRequestOptions<T extends TranslateRequestBuilder> {
  TranslateRequestOptions();

  @JsonKey(name: 'source_lang', includeIfNull: false)
  SourceLanguage? source;

  @JsonKey(name: 'target_lang')
  late TargetLanguage target;

  @JsonKey(
    name: 'formality',
  )
  Formality formality = Formality.def;

  @JsonKey(name: 'glossary_id', includeIfNull: false)
  String? glossaryId;

  TranslateRequestOptions._builder(T builder) {
    source = builder.source;
    target = builder.target;
    formality = builder.formality;
    glossaryId = builder.glossaryId;
  }
}

/// Options for calling [Translations.translateText].
@JsonSerializable()
final class TranslateTextRequestOptions
    extends TranslateRequestOptions<TranslateTextRequestOptionsBuilder> {
  TranslateTextRequestOptions();

  @JsonKey(name: 'text')
  late List<String> text;

  String? context;

  @JsonKey(name: 'split_sentence_option')
  SplitSentenceOption splitSentenceOption = SplitSentenceOption.keep;

  @JsonKey(name: 'preserve_formatting')
  bool preserveFormatting = false;

  Map<String, dynamic> toJson() => _$TranslateTextRequestOptionsToJson(this);

  factory TranslateTextRequestOptions.fromJson(Map<String, dynamic> json) =>
      _$TranslateTextRequestOptionsFromJson(json);

  TranslateTextRequestOptions._builder(
      TranslateTextRequestOptionsBuilder builder)
      : super._builder(builder) {
    text = builder.text;
    context = builder.context;
    preserveFormatting = builder.preserveFormatting;
  }
}

abstract class TranslateRequestBuilder<T> {
  TranslateRequestBuilder({required this.target});

  SourceLanguage? source;

  TargetLanguage target;

  Formality formality = Formality.def;
  String? glossaryId;

  T build();
}

/// Builder class for [TranslateTextRequestOptions]
final class TranslateTextRequestOptionsBuilder
    extends TranslateRequestBuilder<TranslateTextRequestOptions> {
  TranslateTextRequestOptionsBuilder.simple(
      {required String text, required TargetLanguage target})
      : this(text: [text], target: target);

  TranslateTextRequestOptionsBuilder(
      {required this.text, required super.target});

  late List<String> text;

  String? context;

  SplitSentenceOption splitSentenceOption = SplitSentenceOption.keep;
  bool preserveFormatting = false;

  @override
  TranslateTextRequestOptions build() =>
      TranslateTextRequestOptions._builder(this);
}

/// Options for calling [Translations.translateDocument].
@JsonSerializable()
final class TranslateDocumentRequestOptions
    extends TranslateRequestOptions<TranslateDocumentRequestOptionsBuilder> {
  TranslateDocumentRequestOptions();
  late String filename;

  @JsonKey(name: 'output_format', includeIfNull: false)
  SupportetFileTypes? outputFormat;

  Map<String, dynamic> toJson() =>
      _$TranslateDocumentRequestOptionsToJson(this);

  factory TranslateDocumentRequestOptions.fromJson(Map<String, dynamic> json) =>
      _$TranslateDocumentRequestOptionsFromJson(json);

  @override
  TranslateDocumentRequestOptions._builder(
      TranslateDocumentRequestOptionsBuilder builder)
      : super._builder(builder) {
    filename = builder.filename;
    outputFormat = builder.outputFormat;
  }
}

final class TranslateDocumentRequestOptionsBuilder
    extends TranslateRequestBuilder<TranslateDocumentRequestOptions> {
  TranslateDocumentRequestOptionsBuilder(
      {required this.filename, required super.target});

  late String filename;

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

/// Enum for formality options
@JsonEnum()
enum Formality {
  /// Default formality
  @JsonValue('default')
  def,

  /// more
  @JsonValue('more')
  more,

  /// less
  @JsonValue('less')
  less,

  /// prefer more
  @JsonValue('prefer_more')
  preferMore,

  /// prefer less
  @JsonValue('prefer_less')
  preferLess
}

enum SupportetFileTypes {
  /// Microsoft Word Document
  docx,

  // Microsoft PowerPoint Document
  pptx,

  // Microsoft Excel Document
  xlsx,

  /// Portable Document
  pdf,

  /// HTML- Document
  htm,

  // HTML Document
  html,

  /// Plain Text
  txt, // - Plain Text Document

  /// xliff - XLIFF Document, version 2.1
  xlf,

  srt
}
