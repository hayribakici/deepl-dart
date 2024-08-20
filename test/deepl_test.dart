import 'package:deepl/deepl.dart';
import 'package:deepl/src/models/_models.dart';
import 'package:test/test.dart';

import 'deepl_mock_api.dart';

void main() {
  late DeepLMockApi deepl;

  setUp(() {
    deepl = DeepLMockApi.create();
  });

  tearDown(() => interceptor = null);

  group('glossary', () {
    test('supported language types', () async {
      var pairs = await deepl.glossary.supportedLanguagePairs();
      expect(pairs, isNotNull);
      expect(pairs.length, 1);
      expect(pairs.first.source, GlossaryLanguage.en);
      expect(pairs.first.target, GlossaryLanguage.de);
    });

    test('list glossaries', () async {
      var glossaries = await deepl.glossary.list();
      expect(glossaries, isNotNull);
      expect(glossaries.length, 1);

      var first = glossaries.first;
      expect(first.id, "123");
      expect(first.name, "My Glossary");
      expect(first.ready, true);
      expect(first.sourceLanguage, GlossaryLanguage.en);
      expect(first.targetLanguage, GlossaryLanguage.de);
      expect(first.entryCount, 1);
      expect(first.creationTime, DateTime.utc(2021, 8, 3, 14, 16, 18, 329));
    });

    test('get glossary', () async {
      var first = await deepl.glossary.get("123");
      expect(first.id, "123");
      expect(first.name, "My Glossary");
      expect(first.ready, true);
      expect(first.sourceLanguage, GlossaryLanguage.en);
      expect(first.targetLanguage, GlossaryLanguage.de);
      expect(first.entryCount, 1);
      expect(first.creationTime, DateTime.utc(2021, 8, 3, 14, 16, 18, 329));
    });

    test('get entries', () async {
      // var entries = await deepl.glossary.getEntries("123");
      // expect(entries, isNotNull);
      // expect(entries.length, 2);
    });

    test('create entry', () async {
      interceptor = (method, url, headers, [body]) {
        expect(method, 'POST');
        expect(body, isNotNull);
        expect(body,
            "{\"name\":\"name\",\"source_lang\":\"de\",\"target_lang\":\"en\",\"entries\":\"Hallo,Hello\",\"entries_format\":\",\"}");
      };

      await deepl.glossary.create(
          name: "name",
          languagePair:
              LanguagePair.create(GlossaryLanguage.de, GlossaryLanguage.en),
          glossaryEntries: {'Hallo': 'Hello'},
          glossaryFormat: GlossaryFormat.csv);
    });
  });

  group('translation', () {
    test('translate', () async {
      var translated = await deepl.translations
          .translateText('hello', target: TargetLanguage.ES);
      expect(translated, isNotNull);

      expect(translated, isNotEmpty);
      expect(translated.first.detectedLanguage, SourceLanguage.DE);
      expect(translated.first.text, 'hola');
    });
  });
}
