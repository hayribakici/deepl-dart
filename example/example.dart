import 'package:deepl_dart/deepl.dart';

void main() async {

  var deeplApi = DeepLFreeApi();
  var pairs = await deeplApi.glossary.supportedLanguagePairs();
  for (var pair in pairs) {
    print(pair.source);
    print(pair.target);
    print('--');
  }
}