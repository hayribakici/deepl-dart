
!This library is a work in progress!

# deepl-dart

This is an inofficial library that accesses the [DeepL API](https://developers.deepl.com/docs).

## Install

Put `deepl: <latest version>` into your `pubspec.yaml` or call  `dart pub add deepl` or `flutter pub add deepl`, respectively.

## Usage

Create an instance with 

```dart
var deeplApi = DeepLApi.fromAuthKey(<your API key>);
```

and access the API through the namespaces e.g.

```dart
var glossaries = await deeplApi.glossaries.list();
for (var glossary in glossaries) {
    print(glossary.name);
}
```

### Supported endpoints

- [ ] translating documents
- [x] translating text
- [x] glossaries
- [x] tranlation quota


