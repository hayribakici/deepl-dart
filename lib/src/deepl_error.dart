part of '../deepl.dart';

class DeepLException extends HttpException {
  int? status;

  DeepLException(super.message, [this.status]);

  factory DeepLException.fromError(int status, DeepLError error) {
    return DeepLException(error.message ?? '', status);
  }
}
