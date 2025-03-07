part of '_models.dart';

abstract class BaseRequestBuilder<T> {
  BaseRequestBuilder({required this.target});

  TargetLanguage target;

  T build();
}

abstract class BaseRequestOptions<T extends BaseRequestBuilder> {
  BaseRequestOptions();

  @JsonKey(name: 'target_lang')
  late TargetLanguage target;

  BaseRequestOptions._builder(T builder) {
    target = builder.target;
  }
}
