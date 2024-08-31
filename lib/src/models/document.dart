// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '_models.dart';

/// Model class for checking the status of an uploaded document.
abstract class DocumentStatus {
  DocumentStatus();

  @JsonKey(name: 'document_id')
  String? documentId;

  /// Translation status from the the translation engine.
  @JsonKey(name: 'status')
  TranslationStatus? translationStatus;

  factory DocumentStatus.fromJson(Map<String, dynamic> json) {
    var tStatus =
        $enumDecodeNullable(_$TranslationStatusEnumMap, json['status']);
    switch (tStatus) {
      case TranslationStatus.queued:
        return StatusQueued.fromJson(json);
      case TranslationStatus.translating:
        return StatusTranslating.fromJson(json);
      case TranslationStatus.error:
        return StatusError.fromJson(json);
      default:
        return StatusDone.fromJson(json);
    }
  }
}

@JsonSerializable(createToJson: false)
class StatusQueued extends DocumentStatus {
  StatusQueued();
  factory StatusQueued.fromJson(Map<String, dynamic> json) =>
      _$StatusQueuedFromJson(json);
}

@JsonSerializable(createToJson: false)
class StatusTranslating extends DocumentStatus {
  StatusTranslating();

  /// Estimated number of seconds until the translation is done.
  /// This parameter is only included while [translationStatus] is [TranslationStatus.translating].
  @JsonKey(name: 'seconds_remaining')
  int? secondsRemaining;

  factory StatusTranslating.fromJson(Map<String, dynamic> json) =>
      _$StatusTranslatingFromJson(json);
}

@JsonSerializable(createToJson: false)
class StatusDone extends DocumentStatus {
  StatusDone();

  /// The number of characters billed to your account.
  /// The characters will only be billed after a successful download request.
  @JsonKey(name: 'billed_characters')
  int? billedCharacters;

  factory StatusDone.fromJson(Map<String, dynamic> json) =>
      _$StatusDoneFromJson(json);
}

@JsonSerializable(createToJson: false)
class StatusError extends DocumentStatus {
  StatusError();

  /// A short description of the error, if available. Note that the content is subject to change.
  /// This parameter may be included if an error occurred during translation.
  @JsonKey(name: 'error_message')
  String? errorMessage;

  factory StatusError.fromJson(Map<String, dynamic> json) =>
      _$StatusErrorFromJson(json);
}

/// Model class that represents an uploaded document reference.
@JsonSerializable(createToJson: false)
class Document {
  Document(this.documentId, this.documentKey);

  /// The generated id of the uploaded document.
  @JsonKey(name: 'document_id')
  String documentId;

  /// The generated key of the uploaded document.
  @JsonKey(name: 'document_key')
  String documentKey;

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);
}

abstract class DocumentTranslationStatus {}

class DocumentTranslationStatusDone extends DocumentTranslationStatus {
  late File file;
}

class DocumentTranslationStatusTranslating extends DocumentTranslationStatus {
  DocumentTranslationStatusTranslating(this.secondsRemaining);
  late int secondsRemaining;
}

class DocumentTranslationStatusQueued extends DocumentTranslationStatus {}

/// Document tranlation statuss
enum TranslationStatus { queued, translating, done, error }
