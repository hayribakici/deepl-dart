// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '../../deepl.dart';

///
class Documents extends DeepLEndpoint {
  Documents(super.api);

  @override
  String get _path => 'document';

  final supportedFileTypes = SupportetFileTypes.values.map((e) => e.name);

  /// Uploads a document referenced as [filename].
  Future<Document> uploadDocument(
      String filename, TargetLanguage targetLanguage,
      {TranslateDocumentRequestOptions? options}) async {
    var extension = filename.split('.').last;
    if (!supportedFileTypes.contains(extension)) {
      throw ArgumentError(
          'File is unsupported file type. Allowed: $supportedFileTypes');
    }
    Map<String, String> jsonMap = {};
    jsonMap['filename'] = filename;
    jsonMap['target_lang'] = targetLanguage.name;
    return Document.fromJson(
        jsonDecode(await _api._postFormData(_path, filename, fields: jsonMap)));
  }

  /// Retrieve the [DocumentStatus] of the [documentId] and [documentKey]
  Future<DocumentStatus> status(String documentId, String documentKey) async {
    var jsonResponse = await _post('$_path/$documentId', documentKey);
    return DocumentStatus.fromJson(jsonDecode(jsonResponse));
  }
}
