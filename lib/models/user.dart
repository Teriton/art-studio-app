import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserAdd {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String login;
  final String psw;
  final bool admin;

  UserAdd({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.login,
    required this.psw,
    required this.admin,
  });
  factory UserAdd.fromJson(Map<String, dynamic> json) =>
      _$UserAddFromJson(json);
  Map<String, dynamic> toJson() => _$UserAddToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class User extends UserAdd {
  final int id;

  User({
    required this.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phoneNumber,
    required super.login,
    required super.psw,
    required super.admin,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
