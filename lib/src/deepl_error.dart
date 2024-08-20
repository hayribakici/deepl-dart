part of '../deepl.dart';


class DeepLExcetpion extends HttpException {

  int status;

  DeepLExcetpion(super.message, this.status);
  
}