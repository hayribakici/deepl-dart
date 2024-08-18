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
