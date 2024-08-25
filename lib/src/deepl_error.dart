part of '../deepl.dart';

class DeepLException extends HttpException {
  int? status;

  DeepLException(super.message, [this.status]);

  factory DeepLException.fromError(DeepLError error) {
    // message = error.message;
    // status = error.sta
    return DeepLException('error');
  }
}
