import 'dart:async';

import 'package:flutter_arms/features/authentication/data/datasource/auth_datasource.dart';
import 'package:flutter_arms/features/authentication/domain/repositories/auth_repository.dart';
import 'package:flutter_arms/shared/domain/models/either.dart';
import 'package:flutter_arms/shared/domain/models/user/user.dart';
import 'package:flutter_arms/shared/exceptions/app_exception.dart';



class AuthRepositoryImpl extends AuthRepository{
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  final _streamController = StreamController<AuthenticationStatus>();

  @override
  Future<Either<AppException, User>> login({required User user}) {
    return authDataSource.login(user: user);
  }

  @override
  Stream<AuthenticationStatus> checkLoginStatus() async* {
    var hasUser = await authDataSource.checkLoginStatus();
   if(hasUser){
     yield AuthenticationStatus.authenticated;
   }
   else{
     yield AuthenticationStatus.unauthenticated;
   }
   yield* _streamController.stream;
  }

  @override
  Future<bool> logout() {
    return authDataSource.logout();

  }





}