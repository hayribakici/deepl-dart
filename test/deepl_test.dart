import 'package:deepl/deepl.dart';
import 'package:deepl/src/models/_models.dart';
import 'package:test/test.dart';

import 'deepl_mock_api.dart';

void main() {
  late DeepLApi deepl;

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
      interceptor = (method, url, headers, [body]) {
        expect(method, 'POST');
        expect(body, isNotNull);
        expect(body,
            '{"target_lang":"ES","formality":"default","text":["hello"],"context":null,"split_sentence_option":"keep","preserve_formatting":false}');
      };
      var translated = await deepl.translations.translateText(
        options: TranslateTextRequestOptionsBuilder.simple(
          text: 'hello',
          target: TargetLanguage.ES,
        ).build(),
      );
      expect(translated, isNotNull);

      expect(translated, isNotEmpty);
      expect(translated.first.detectedLanguage, SourceLanguage.DE);
      expect(translated.first.text, 'hola');
    });
  });

  group('documents', () {
    // test('translate document', () async {
    //   deepl = DeepLMockApi.streaming();
    //   interceptor = (method, url, headers, [body]) {
    //     print(body);
    //   };
    //   var t = await deepl.documents.uploadDocument(
    //       options: TranslateDocumentRequestOptionsBuilder(
    //               filename: '${Directory.current.path}/example/translate.txt',
    //               target: TargetLanguage.ES)
    //           .build());
    //   expect(t, isNotNull);
    // });

    group('status', () {
      test('status queued', () async {
        var s = await deepl.documents.status(Document('123_queued', 'key'));
        expect(s.key, TranslationStatus.queued);
        expect(s.value, isA<StatusQueued>());
      });
      test('status translating', () async {
        var s =
            await deepl.documents.status(Document('123_translating', 'key'));
        expect(s.key, TranslationStatus.translating);
        expect(s.value, isA<StatusTranslating>());
        var v = s.value as StatusTranslating;
        expect(v.secondsRemaining, 1337);
      });

      test('status done', () async {
        var s = await deepl.documents.status(Document('123_done', 'key'));
        expect(s.key, TranslationStatus.done);
        expect(s.value, isA<StatusDone>());
        var v = s.value as StatusDone;
        expect(v.billedCharacters, 1337);
      });

      test('status error', () async {
        var s = await deepl.documents.status(Document('123_error', 'key'));
        expect(s.key, TranslationStatus.error);
        expect(s.value, isA<StatusError>());
        var v = s.value as StatusError;
        expect(v.errorMessage, 'Only');
      });
    });
  });

  group('quota', () {
    test('get', () async {
      var quota = await deepl.quota.get();
      expect(quota, isNotNull);
      expect(quota.characterCount, 10);
      expect(quota.characterLimit, 10);
    });
  });

  group('language', () {
    test('supported languages', () async {
      var supported = await deepl.languages.supportedLanguages();
      expect(supported, isNotNull);
      expect(supported.first.sourceLang, SourceLanguage.BG);
      expect(supported.first.name, 'Bulgarian');
      expect(supported.first.supportsFormality, false);
    });
  });
}
