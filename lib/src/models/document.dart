part of '_models.dart';

@JsonSerializable(createToJson: false)
class DocumentStatus {
  DocumentStatus();

  @JsonKey(name: 'document_id')
  String? documentId;

  Status? status;

  @JsonKey(name: 'billed_characters')
  int? billedCharacters;

  @JsonKey(name: 'error_message')
  String? errorMessage;

  factory DocumentStatus.fromJson(Map<String, dynamic> json) => _$DocumentStatusFromJson(json);
}


@JsonSerializable(createToJson: false)
class Document {
  // Document();

  Document(this.documentId, this.documentKey);

  @JsonKey(name: 'document_id')
  String documentId;

  @JsonKey(name: 'document_key')
  String documentKey;

  factory Document.fromJson(Map<String, dynamic> json) => _$DocumentFromJson(json);
}

enum Status { queued, translating, done, error }
