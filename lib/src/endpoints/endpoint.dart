// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '../../deepl.dart';

abstract class DeepLEndpoint {
  // ignore: unused_element
  String get _path;
  
  final DeepLApi _api;
  
  DeepLEndpoint(this._api);
}