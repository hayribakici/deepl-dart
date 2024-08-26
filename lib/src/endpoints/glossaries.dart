// Copyright (c) 2024, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of '../../deepl.dart';

class Glossaries extends DeepLEndpoint {
  @override
  String get _path => 'glossaries';

  Glossaries(super.api);

  /// Retrieve the list of [LanguagePair]s supported by the glossary feature.
  Future<Iterable<LanguagePair>> supportedLanguagePairs() async =>
      _handleList('glossary-language-pairs',
          jsonKey: 'supported_languages', fromJson: LanguagePair.fromJson);

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
    return Glossary.fromJson(jsonDecode(await _post(_path, jsonEncode(body))));
  }

  /// List all glossaries and their meta-information, without the glossary entries.
  Future<Iterable<Glossary>> list() async =>
      _handleList(_path, jsonKey: 'glossaries', fromJson: Glossary.fromJson);

  /// Retrieves the glossary through its [id], without the glossary entries
  Future<Glossary> get(String id) async =>
      _handleGet('$_path/$id', fromJson: Glossary.fromJson);

  Future<void> delete(String id) async => _api._delete('$_path/$id');

  /// Retrieves the entries from [id].
  // FIXME
  Future<Map<String, String>> getEntries(String id) async {
    String responseString = await _get('$_path/$id/entries',
        headers: {'accept': 'text/tab-separated-values'});
    Map<String, String> entries = {};

    try {
      // var entryLines = responseString.split('\n');
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
