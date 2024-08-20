// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '_models.dart';

/// Model class that represents the API usage.
@JsonSerializable(createToJson: false)
class Quota {

  Quota();

  /// Characters translated so far in the current billing period.
  @JsonKey(name: 'character_count', defaultValue: 0)
  int? characterCount;

  /// Current maximum number of characters that can be translated per billing period. 
  /// 
  /// If cost control is set, the cost control limit will be returned in this field.
  @JsonKey(name: 'character_limit', defaultValue: 0)
  int? characterLimit;

  factory Quota.fromJson(Map<String, dynamic> json) => _$QuotaFromJson(json);
}
