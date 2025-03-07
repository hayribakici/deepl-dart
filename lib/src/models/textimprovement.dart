// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// ignore_for_file: constant_identifier_names

part of '_models.dart';

/// Model class that represents the Language API.
@JsonSerializable(createToJson: false)
class TextImprovement {
  factory TextImprovement.fromJson(Map<String, dynamic> json) =>
      _$TextImprovementFromJson(json);

  TextImprovement();

  @JsonKey()
  String? text;

  @JsonKey(name: 'target_language', unknownEnumValue: TargetLanguage.unknown)
  TargetLanguage? targetLanguage;

  @JsonKey(
      name: 'detected_source_language',
      unknownEnumValue: SourceLanguage.unknown)
  SourceLanguage? detectedSourceLanguage;
}

/// Options for calling [TextImprovements.improveText]
@JsonSerializable()
final class TextImprovmentRequestOptions
    extends BaseRequestOptions<TextImprovementRequestOptionsBuilder> {
  TextImprovmentRequestOptions({required this.text});

  Map<String, dynamic> toJson() => _$TextImprovmentRequestOptionsToJson(this);

  @JsonKey(name: 'text')
  late List<String> text;

  @JsonKey(
      name: 'writing_style',
      unknownEnumValue: WritingStyle.defaultStyle,
      defaultValue: WritingStyle.defaultStyle)
  late WritingStyle? writingStyle;

  @JsonKey(unknownEnumValue: Tone.defaultTone, defaultValue: Tone.defaultTone)
  late Tone? tone;

  factory TextImprovmentRequestOptions.fromJson(Map<String, dynamic> json) =>
      _$TextImprovmentRequestOptionsFromJson(json);

  TextImprovmentRequestOptions._builder(
      TextImprovementRequestOptionsBuilder builder)
      : super._builder(builder) {
    text = [builder.text];
    writingStyle = builder.writingStyle;
    tone = builder.tone;
  }
}

final class TextImprovementRequestOptionsBuilder
    extends BaseRequestBuilder<TextImprovmentRequestOptions> {
  TextImprovementRequestOptionsBuilder(
      {required this.text, required super.target});

  String text;

  WritingStyle? writingStyle;
  Tone? tone;

  @override
  TextImprovmentRequestOptions build() =>
      TextImprovmentRequestOptions._builder(this);
}

@JsonEnum()
enum WritingStyle {
  simple,
  buisiness,
  academic,
  casual,
  defaultStyle,
  @JsonValue('prefer_simple')
  preferSimple,
  @JsonValue('prefer_business')
  preferBusiness,
  @JsonValue('prefer_academic')
  preferAcademic,
  @JsonValue('prefer_casual')
  preferCasual
}

@JsonEnum()
enum Tone {
  enthusiastic,
  friendly,
  confident,
  diplomatic,
  defaultTone,
  @JsonValue('prefer_enthusiastic')
  preferEnthusiastic,
  @JsonValue('prefer_friendly')
  preferFriendly,
  @JsonValue('prefer_confident')
  preferConfident,
  @JsonValue('prefer_diplomatic')
  preferDiplomatic
}
