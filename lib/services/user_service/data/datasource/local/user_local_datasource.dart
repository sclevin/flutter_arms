import 'dart:convert';

import 'package:flutter_arms/services/user_service/data/datasource/user_datasource.dart';
import 'package:flutter_arms/shared/data/local/storage_service.dart';
import 'package:flutter_arms/shared/domain/models/either.dart';
import 'package:flutter_arms/shared/domain/models/user/user.dart';
import 'package:flutter_arms/shared/exceptions/app_exception.dart';
import 'package:flutter_arms/shared/globals.dart';

class UserLocalDatasource extends UserDataSource{
  final StorageService storageService;

  UserLocalDatasource(this.storageService);

  @override
  Future<bool> deleteUser() async {
    return await storageService.remove(storageKey);
  }

  @override
  Future<Either<AppException, User>> fetchUser() async{
    final data = await storageService.get(storageKey);
    if(data == null){
      return Left(AppException(
        code: 404,
        message: "User not found",
        identifier: "UserLocalDatasource"
      ));
    }

    final userJson =jsonDecode(data.toString());
    return Right(User.fromJson(userJson));
  }

  @override
  Future<bool> hasUser() async {
    var hasUser = await storageService.has(storageKey);
    return hasUser;
  }

  @override
  Future<bool> saveUser({required User user}) async {
    return await storageService.set(storageKey, jsonEncode(user.toJson()));
  }

  @override
  String get storageKey => USER_LOCAL_STORAGE_KEY;

}