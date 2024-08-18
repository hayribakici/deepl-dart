// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:deepl_dart/deepl.dart';
import 'package:deepl_dart/env/env.dart';

void main() async {

  var deeplApi = DeepLFreeApi(Env.deeplApiKey);
  var pairs = await deeplApi.glossary.supportedLanguagePairs();
  for (var pair in pairs) {
    print(pair.source);
    print(pair.target);
    print('--');
  }
}