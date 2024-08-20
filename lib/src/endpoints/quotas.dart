// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '../../deepl.dart';

class Quotas extends DeepLEndpoint {
  @override
  String get _path => 'usage';

  Quotas(super.api);

  /// Retrieve the usage of the API
  Future<Quota> get() async => _handleGet(_path, fromJson: Quota.fromJson);
}
