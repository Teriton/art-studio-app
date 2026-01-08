// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technique.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TechniqueAdd _$TechniqueAddFromJson(Map<String, dynamic> json) => TechniqueAdd(
  name: json['name'] as String,
  description: json['discription'] as String,
);

Map<String, dynamic> _$TechniqueAddToJson(TechniqueAdd instance) =>
    <String, dynamic>{
      'name': instance.name,
      'discription': instance.description,
    };

Technique _$TechniqueFromJson(Map<String, dynamic> json) => Technique(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['discription'] as String,
);

Map<String, dynamic> _$TechniqueToJson(Technique instance) => <String, dynamic>{
  'name': instance.name,
  'discription': instance.description,
  'id': instance.id,
};

TechniqueWorkshops _$TechniqueWorkshopsFromJson(Map<String, dynamic> json) =>
    TechniqueWorkshops(
      workshops: (json['workshops'] as List<dynamic>)
          .map((e) => Workshop.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['discription'] as String,
    );

Map<String, dynamic> _$TechniqueWorkshopsToJson(TechniqueWorkshops instance) =>
    <String, dynamic>{
      'name': instance.name,
      'discription': instance.description,
      'id': instance.id,
      'workshops': instance.workshops,
    };
