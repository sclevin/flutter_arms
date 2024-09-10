
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../domain/models/either.dart';

class AppException implements Exception{
  final int code;
  final String message;
  final String identifier;

  AppException({
    required this.code,
    required this.message,
    required this.identifier
});

  @override
  String toString() {
    return 'statusCode=$code\nmessage=$message\nidentifier=$identifier';
  }
}


class CacheFailureException extends Equatable implements AppException {
  final String message;

  const CacheFailureException(this.message);

  @override
  String get identifier => 'Cache failure exception';




  @override
  int get code => -1;

  @override
  List<Object?> get props => [message, code, identifier];

}


extension HttpExceptionExtension on AppException{
  Left<AppException, Response> get toLeft => Left<AppException, Response>(this);
}