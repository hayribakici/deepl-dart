!This library is a work in progress!

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

### Supported endpoints

- [x] Translating documents
  - [x] Pploading files
  - [x] Checking file status
  - [x] Downloading document
- [x] Translating text
- [x] Glossaries
- [x] Tranlation quota
