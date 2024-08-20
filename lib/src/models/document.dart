part of '_models.dart';

/// Model class for checking the status of an uploaded document.
@JsonSerializable(createToJson: false)
class DocumentStatus {
  DocumentStatus();

  @JsonKey(name: 'document_id')
  String? documentId;

  /// Translation status from the the translation engine.
  @JsonKey(name: 'status')
  TranslationStatus? translationStatus;

  @JsonKey(name: 'billed_characters')
  int? billedCharacters;

  @JsonKey(name: 'error_message')
  String? errorMessage;

  factory DocumentStatus.fromJson(Map<String, dynamic> json) =>
      _$DocumentStatusFromJson(json);
}

/// Model class that represents an uploaded document reference.
@JsonSerializable(createToJson: false)
class Document {
  Document(this.documentId, this.documentKey);

  /// The id of the uploaded document.
  @JsonKey(name: 'document_id')
  String documentId;

  /// The key of the uploaded document.
  @JsonKey(name: 'document_key')
  String documentKey;

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);
}

/// Document tranlation statuss
enum TranslationStatus { queued, translating, done, error }
