// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '_models.dart';

@JsonSerializable(createToJson: false)
class Quota {

  Quota();

  @JsonKey(name: 'character_count', defaultValue: 0)
  int? characterCount;
  @JsonKey(name: 'character_limit', defaultValue: 0)
  int? characterLimit;

  factory Quota.fromJson(Map<String, dynamic> json) => _$QuotaFromJson(json);
}
