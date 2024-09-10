import 'package:flutter_arms/shared/exceptions/app_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState{
  const factory AuthState.unknown() = UnKnown;
  const factory AuthState.authenticated() = Authenticated;
  const factory AuthState.authenticating() = Authenticating;
  const factory AuthState.unauthenticated() = UnAuthenticated;
}