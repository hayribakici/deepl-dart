# deepl-dart

This is an inofficial library that accesses the [DeepL API](https://developers.deepl.com/docs).

## Install

Put `deepl: <latest version>` into your `pubspec.yaml` or call `dart pub add deepl` or `flutter pub add deepl`, respectively.

## Usage

Create an instance with

```dart
var deeplApi = DeepLApi.fromAuthKey(<your API key>);
```

and access the API through the namespaces e.g.

```dart
var translation = (await deepl.translations.translateText(
    options: TranslateTextRequestOptionsBuilder.simple(
      text: 'Hello',
      target: TargetLanguage.ES,
    ).build(),
  ))
      .first;
  print(
      'Detected language: ${translation.detectedLanguage?.name}, translation: ${translation.text}');
```

#### Translating Documents

To translate a document, you must first upload it with

```dart
var document = await deepl.documents.uploadDocument(
    options: TranslateDocumentRequestOptionsBuilder(
      filename: '<your_filename>',
      target: TargetLanguage.ES,
    ).build(),
  ));
```

If it is a large document, you could check its translation status with

```dart
var status = await deepl.document.status(document);
print('Status: ${status.key}'');
// works only if `status.key == TranslationStatus.translating`
print('Estd. seconds: ${(status.value as StatusTranslating).estimatedSeconds}');
```

and finally download it with

```dart
var file = await deepl.document.downloadDocument(document, '<your_translated_filename>');
```

##### Translating as a stream

There is also a more streamlined approach when translating a document.

The filename is contained in the `options`. The translated document will be stored in the same directory as the original and will be named with the `TargetLanguage` filename suffix (e.g. gatsby_ES.txt).

```dart
var curr = Directory.current.path;
  deepl.documents
      .translateDocument(
          options: TranslateDocumentRequestOptionsBuilder(
    filename: '$curr/example/gatsby.txt',
    target: TargetLanguage.ES,
  ).build())
      .listen((event) {
    switch (event.runtimeType) {
      case StatusQueued:
        print('Queued');
        break;
      case StatusTranslating:
        stdout.write('\r${(event as StatusTranslating).secondsRemaining}s');
        break;
      case StatusDone:
        print('Done');
    }
  });
```

### Supported endpoints

- [x] Translating documents (`deepl.documents`)
  - [x] Pploading files
  - [x] Checking file status
  - [x] Downloading document
- [x] Translating text (`deepl.translate`)
- [x] Glossaries (`deepl.glossaries`)
- [x] Tranlation quota (`deepl.quota`)
