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
