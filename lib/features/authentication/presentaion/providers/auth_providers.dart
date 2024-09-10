import 'package:flutter_arms/features/authentication/data/datasource/auth_datasource.dart';
import 'package:flutter_arms/features/authentication/data/datasource/local/auth_local_datasource.dart';
import 'package:flutter_arms/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:flutter_arms/features/authentication/domain/repositories/auth_repository.dart';
import 'package:flutter_arms/features/authentication/presentaion/providers/state/auth_notifier.dart';
import 'package:flutter_arms/features/authentication/presentaion/providers/state/auth_state.dart';
import 'package:flutter_arms/services/user_service/data/datasource/local/user_local_datasource.dart';
import 'package:flutter_arms/services/user_service/domain/repositories/user_repository.dart';
import 'package:flutter_arms/services/user_service/presentation/providers/user_providers.dart';
import 'package:flutter_arms/shared/data/local/shared_prefs_storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _authDatasourceProvider = Provider<AuthDataSource>(
    (_) => LocalAuthDataSource(UserLocalDatasource(SharedPrefsService()))
);


final _authRepositoryProvider =Provider<AuthRepository>((ref){
  final datasource = ref.watch(_authDatasourceProvider);
  return AuthRepositoryImpl(datasource);
});


final authStateNotifierProvider = StateNotifierProvider<AuthNotifier,AuthState>((ref){
  final AuthRepository authRepository = ref.watch(_authRepositoryProvider);
  final UserRepository userRepository = ref.watch(userRepositoryProvider);
  return AuthNotifier(authRepository: authRepository, userRepository: userRepository);
});