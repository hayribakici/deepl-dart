import 'dart:convert';

import 'package:deepl/deepl.dart';
import 'package:deepl/src/models/_models.dart';
import 'dart:io';

void main(List<String> args) async {
  var deepl = await _getApi();
  var s = await deepl.languages.supportedLanguages();
  print(s.map((e) => e.name).join(','));

  var h = 'hello';
  var t = TargetLanguage.ES;
  print('Translating \'$h\' to ${t.name}:');
  var translation = (await deepl.translations.translateText(
    options: TranslateTextRequestOptionsBuilder.simple(
      text: 'Hello',
      target: TargetLanguage.ES,
    ).build(),
  ))
      .first;
  print(
      'Detected language: ${translation.detectedLanguage?.name}, translation: ${translation.text}');
  var curr = Directory.current.path;
  print('Translating document $curr/example/translate.txt');
  var id = (await deepl.documents.uploadDocument(
    options: TranslateDocumentRequestOptionsBuilder(
      filename: '$curr/example/translate.txt',
      target: TargetLanguage.ES,
    ).build(),
  ));
  print('key: ${id.documentId} ${id.documentKey}');
  Future.delayed(Duration(seconds: 3), () async {
    var status = (await deepl.documents.status(id));
    print(status.translationStatus);
  });
}

Future<DeepLApi> _getApi() async {
  var keyJson = await File('example/.apikey').readAsString();
  var keyMap = json.decode(keyJson);
  return DeepLApi.fromAuthKey(keyMap['key']);
}
