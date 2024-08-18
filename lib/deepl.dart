// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library deepl;

import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:deepl_dart/src/models/_models.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

part 'src/deepl_api.dart';
part 'src/endpoints/endpoint.dart';
part 'src/endpoints/documents.dart';
part 'src/endpoints/glossaries.dart';
part 'src/endpoints/translations.dart';

