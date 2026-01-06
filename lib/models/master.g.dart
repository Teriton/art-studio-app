// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterAdd _$MasterAddFromJson(Map<String, dynamic> json) => MasterAdd(
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  specialization: json['specialization'] as String,
  experience: (json['expirience'] as num).toInt(),
  bio: json['bio'] as String,
  image: json['image'] as String,
);

Map<String, dynamic> _$MasterAddToJson(MasterAdd instance) => <String, dynamic>{
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'specialization': instance.specialization,
  'expirience': instance.experience,
  'bio': instance.bio,
  'image': instance.image,
};

Master _$MasterFromJson(Map<String, dynamic> json) => Master(
  id: (json['id'] as num).toInt(),
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  specialization: json['specialization'] as String,
  experience: (json['expirience'] as num).toInt(),
  bio: json['bio'] as String,
  image: json['image'] as String,
);

Map<String, dynamic> _$MasterToJson(Master instance) => <String, dynamic>{
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'specialization': instance.specialization,
  'expirience': instance.experience,
  'bio': instance.bio,
  'image': instance.image,
  'id': instance.id,
};
