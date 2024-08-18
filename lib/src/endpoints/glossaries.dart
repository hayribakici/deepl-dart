// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '../../deepl.dart';

class Glossaries extends DeepLEndpoint {
  @override
  String get _path => 'glossaries';

  Glossaries(super.api);

  /// Retrieves all supported [LanguagePair]s.
  Future<Iterable<LanguagePair>> supportedLanguagePairs() async {
    String jsonString = await _api._get('glossary-language-pairs');
    var tJson =
        jsonDecode(jsonString)['supported_languages'] as Iterable<dynamic>;
    return tJson.map((json) => LanguagePair.fromJson(json));
  }

  /// Creates a [Glossary]
  Future<Glossary> create(
      {required String name,
      required LanguagePair languagePair,
      required Map<String, String> glossaryEntries,
      required GlossaryFormat glossaryFormat}) async {
    var body = {
      'name': name,
      'source_lang': languagePair.source?.name,
      'target_lang': languagePair.target?.name,
      'entries': _buildEntriesValue(glossaryEntries, glossaryFormat),
      'entries_format': glossaryFormat.formatValue
    };
    return Glossary.fromJson(
        jsonDecode(await _api._post(_path, jsonEncode(body))));
  }

  /// Retrieves all glossaries the user has created
  Future<Iterable<Glossary>> list() async {
    String jsonString = await _api._get(_path);
    var tJson = jsonDecode(jsonString)['glossaries'] as Iterable<dynamic>;
    return tJson.map((json) => Glossary.fromJson(json));
  }

  /// Retrieves the glossary through its [id].
  Future<Glossary> get(String id) async {
    String jsonString = await _api._get('$_path/$id');
    return Glossary.fromJson(jsonDecode(jsonString));
  }

  /// Retrieves the entries from [id].
  Future<Map<String, String>> getEntries(String id) async {
    String responseString = await _api._get('$_path/$id/entries',
        headers: {'accept': 'text/tab-separated-values'});
    Map<String, String> entries = {};

    try {
      var entryLines = responseString.split('\n');
      // var split = entryLines.map((e) => e.split(GlossaryFormat.tsv.formatValue));
      // entries = { for (var item in split) item[0] : item[1] };
      var parsed =
          CsvToListConverter(fieldDelimiter: GlossaryFormat.tsv.formatValue)
              .convert(responseString);
      entries = {for (var item in parsed) item.first: item[1]};
    } catch (e) {
      return Future.error('error');
    }
    return entries;
  }

  String _buildEntriesValue(
      Map<String, String> glossaryEntries, GlossaryFormat glossaryFormat) {
    String entrySeparator;
    switch (glossaryFormat) {
      case GlossaryFormat.tsv:
        entrySeparator = '\n';
        break;
      case GlossaryFormat.csv:
        entrySeparator = glossaryFormat.formatValue;
        break;
      default:
        // shouldn't happen
        entrySeparator = '';
    }
    Iterable<String> convertedEntries = glossaryEntries.entries.map(
        (entry) => '${entry.key}${glossaryFormat.formatValue}${entry.value}');
    return convertedEntries.join(entrySeparator);
  }
}
