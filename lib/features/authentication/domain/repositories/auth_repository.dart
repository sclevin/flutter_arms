import 'package:flutter_arms/shared/domain/models/either.dart';
import 'package:flutter_arms/shared/exceptions/app_exception.dart';
import '../../../../shared/domain/models/user/user.dart';

enum AuthenticationStatus{
  unknown,
  authenticated,
  unauthenticated,
}

abstract class AuthRepository{
  Future<Either<AppException, User>> login({required User user});

  Future<bool> logout();

  Stream<AuthenticationStatus> checkLoginStatus();
}