part of '_models.dart';

class Response {}

@JsonSerializable(createToJson: false)
class TranslationResponse extends Response {
  @JsonKey(name: 'translations')
  List<Translation>? translations;
}
