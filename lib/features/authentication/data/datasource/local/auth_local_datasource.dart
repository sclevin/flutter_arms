import 'package:flutter_arms/features/authentication/data/datasource/auth_datasource.dart';
import 'package:flutter_arms/services/user_service/data/datasource/user_datasource.dart';
import 'package:flutter_arms/shared/domain/models/either.dart';
import 'package:flutter_arms/shared/domain/models/user/user.dart';
import 'package:flutter_arms/shared/exceptions/app_exception.dart';

class LocalAuthDataSource implements AuthDataSource{
  final UserDataSource userDataSource;


  LocalAuthDataSource(this.userDataSource);

  @override
  Future<Either<AppException, User>> login({required User user}) {
    // TODO: implement login
    throw UnimplementedError();
  }



  @override
  Future<bool> logout() {
   return userDataSource.deleteUser();
  }

  @override
  Future<bool> checkLoginStatus() {
    return userDataSource.hasUser();
  }

}