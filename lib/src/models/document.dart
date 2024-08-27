// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

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

  /// Estimated number of seconds until the translation is done.
  /// This parameter is only included while [translationStatus] is [TranslationStatus.translating].
  @JsonKey(name: 'seconds_remaining')
  int? secondsRemaining;

  /// The number of characters billed to your account.
  /// The characters will only be billed after a successful download request.
  @JsonKey(name: 'billed_characters')
  int? billedCharacters;

  /// A short description of the error, if available. Note that the content is subject to change.
  /// This parameter may be included if an error occurred during translation.
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
