import '../../../../shared/domain/models/either.dart';
import '../../../../shared/domain/models/user/user.dart';
import '../../../../shared/exceptions/app_exception.dart';

abstract class UserRepository{
  Future<Either<AppException, User>> fetchUser();
  Future<bool> saveUser({required User user});
  Future<bool> deleteUser();
  Future<bool> hasUser();
}