import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User{
  const factory User({
    int? id ,
    required String account,
    required String password
  }) = _User;

  factory User.fromJson(Map<String,Object?> json) => _$UserFromJson(json);

}