import 'dart:async';
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
  print('Uploading document $curr/example/gatsby.txt');
  var id = (await deepl.documents.uploadDocument(
    options: TranslateDocumentRequestOptionsBuilder(
      filename: '$curr/example/gatsby.txt',
      target: TargetLanguage.ES,
    ).build(),
  ));
  var status = (await deepl.documents.status(id));
  if (status.key == TranslationStatus.translating) {
    var v = status.value as StatusTranslating;
    var r = v.secondsRemaining ?? 0;
    stdout.write('Translating...');
    _timedCounter(Duration(seconds: 1), r).listen((event) {
      stdout.write('\r${r - event}s');
    }, onDone: () async {
      var status = (await deepl.documents.status(id));
      if (status.key == TranslationStatus.done) {
        print('Downloading Document');
        await deepl.documents
            .downloadDocument(id, '$curr/example/gatsby_es.txt');
        print('Done');
      }
    });
  }
}

Future<DeepLApi> _getApi() async {
  var keyJson = await File('example/.apikey').readAsString();
  var keyMap = json.decode(keyJson);
  return DeepLApi.fromAuthKey(keyMap['key']);
}

Stream<int> _timedCounter(Duration interval, [int? maxCount]) {
  late StreamController<int> controller;
  Timer? timer;
  int counter = 0;

  void tick(_) {
    counter++;
    controller.add(counter); // Ask stream to send counter values as event.
    if (counter == maxCount) {
      timer?.cancel();
      controller.close(); // Ask stream to shut down and tell listeners.
    }
  }

  void startTimer() {
    timer = Timer.periodic(interval, tick);
  }

  void stopTimer() {
    timer?.cancel();
    timer = null;
  }

  controller = StreamController<int>(
      onListen: startTimer,
      onPause: stopTimer,
      onResume: startTimer,
      onCancel: stopTimer);

  return controller.stream;
}
