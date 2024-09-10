import '../../../../shared/domain/models/either.dart';
import '../../../../shared/domain/models/user/user.dart';
import '../../../../shared/exceptions/app_exception.dart';

abstract class AuthDataSource{
  Future<Either<AppException, User>> login({required User user});
  Future<bool> checkLoginStatus();
  Future<bool> logout();
}