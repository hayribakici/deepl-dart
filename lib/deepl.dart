// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library deepl;

import 'dart:convert';
import 'dart:io';
import 'dart:core';

import 'package:csv/csv.dart';
import 'package:deepl/src/models/_models.dart';
import 'package:http/http.dart' as http;

part 'src/deepl_api.dart';
part 'src/deepl_error.dart';
part 'src/endpoints/endpoint.dart';
part 'src/endpoints/documents.dart';
part 'src/endpoints/languages.dart';
part 'src/endpoints/glossaries.dart';
part 'src/endpoints/translations.dart';
part 'src/endpoints/quotas.dart';
