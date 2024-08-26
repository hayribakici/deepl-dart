part of '_models.dart';

@JsonSerializable(createToJson: false)
class DeepLError {
  String? message;

  DeepLError();

  factory DeepLError.fromJson(Map<String, dynamic> json) =>
      _$DeepLErrorFromJson(json);
}
