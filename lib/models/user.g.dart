// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAdd _$UserAddFromJson(Map<String, dynamic> json) => UserAdd(
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  email: json['email'] as String,
  phoneNumber: json['phone_number'] as String,
  login: json['login'] as String,
  psw: json['psw'] as String,
  admin: json['admin'] as bool,
);

Map<String, dynamic> _$UserAddToJson(UserAdd instance) => <String, dynamic>{
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'email': instance.email,
  'phone_number': instance.phoneNumber,
  'login': instance.login,
  'psw': instance.psw,
  'admin': instance.admin,
};

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num).toInt(),
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  email: json['email'] as String,
  phoneNumber: json['phone_number'] as String,
  login: json['login'] as String,
  psw: json['psw'] as String,
  admin: json['admin'] as bool,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'email': instance.email,
  'phone_number': instance.phoneNumber,
  'login': instance.login,
  'psw': instance.psw,
  'admin': instance.admin,
  'id': instance.id,
};
