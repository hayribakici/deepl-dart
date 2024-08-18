// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '_models.dart';

class Response {}

@JsonSerializable(createToJson: false)
class TranslationResponse extends Response {
  @JsonKey(name: 'translations')
  List<Translation>? translations;
}
