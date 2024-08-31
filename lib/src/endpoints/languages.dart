// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '../../deepl.dart';

/// Endpoint for language functionalities.
class Languages extends DeepLEndpoint {
  @override
  String get _path => '/languages';

  Languages(super.api);

  /// Returns supoorted languages
  Future<Iterable<Language>> supportedLanguages() async =>
      _handleList(_path, fromJson: Language.fromJson);
}
