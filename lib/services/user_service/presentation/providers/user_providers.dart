import 'package:flutter_arms/services/user_service/data/datasource/local/user_local_datasource.dart';
import 'package:flutter_arms/services/user_service/data/datasource/user_datasource.dart';
import 'package:flutter_arms/services/user_service/data/repositories/user_repository_impl.dart';
import 'package:flutter_arms/services/user_service/domain/repositories/user_repository.dart';
import 'package:flutter_arms/shared/data/local/storage_service.dart';
import 'package:flutter_arms/shared/domain/providers/shared_prefs_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDatasourceProvider = Provider.family<UserDataSource,StorageService>((_,storageService)
    => UserLocalDatasource(storageService));

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final storageService = ref.watch(storageServiceProvider);
  final dataSource = ref.watch(userDatasourceProvider(storageService));
  return UserRepositoryImpl(dataSource);
});