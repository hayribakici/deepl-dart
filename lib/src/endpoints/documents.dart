// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '../../deepl.dart';

/// 
class Documents extends DeepLEndpoint {
  Documents(super.api);

  @override
  String get _path => 'document';

  /// Uploads a document referenced as [filename].
  Future<Document> uploadDocument(String filename) async {
    return Document('documentId', 'documentKey');
  }

  /// Retrieve the [DocumentStatus] of the [documentId] and [documentKey]
  Future<DocumentStatus> status(String documentId, String documentKey) async {
    var jsonResponse = await _post('$_path/$documentId', documentKey);
    return DocumentStatus.fromJson(jsonDecode(jsonResponse));
  }
}
