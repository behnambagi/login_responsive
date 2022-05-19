import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';
part 'user.g.dart';


@freezed
class UserAuth with _$UserAuth{
  @JsonSerializable(explicitToJson: true)
  const factory UserAuth({required User user, required String token}) = _UserAuth;
  factory UserAuth.fromJson(Map<String, dynamic> json) => _$UserAuthFromJson(json);
}

@freezed
class User with _$User{
  @JsonSerializable(explicitToJson: true)
  const factory User({required int id, required String username, required String email}) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}