import 'package:flutter_arms/features/authentication/domain/repositories/auth_repository.dart';
import 'package:flutter_arms/features/authentication/presentaion/providers/state/auth_state.dart';
import 'package:flutter_arms/services/user_service/domain/repositories/user_repository.dart';
import 'package:flutter_arms/shared/domain/models/user/user.dart';
import 'package:flutter_arms/shared/exceptions/app_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  AuthNotifier(
      {required AuthRepository authRepository,
      required UserRepository userRepository})
      : _authRepository = authRepository,
        _userRepository = userRepository,
        super(const AuthState.authenticating()) {
    _listenToStatus();
  }

  Future<void> _listenToStatus() async {
    _authRepository.checkLoginStatus().listen((status) async {
      switch (status) {
        case AuthenticationStatus.unknown:
          state = const AuthState.unknown();
          break;
        case AuthenticationStatus.authenticated:
          state = const AuthState.authenticated();
          break;
        case AuthenticationStatus.unauthenticated:
          state = const AuthState.unauthenticated();
          break;
      }
    });
  }

  Future<void> login(String account, String password) async {
    state = const AuthState.authenticating();
    final response = await _authRepository.login(
        user: User(account: account, password: password));
    state = await response.fold((e) => const AuthState.unauthenticated(),
        (user) async {
      final hasSavedUser = await _userRepository.saveUser(user: user);
      if (hasSavedUser) {
        return const AuthState.authenticated();
      }
      return  const AuthState.unauthenticated();
    });
  }

  Future<void> logout() async {
     _authRepository.logout();
     state = const AuthState.unauthenticated();
  }
}
