// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialAdd _$MaterialAddFromJson(Map<String, dynamic> json) => MaterialAdd(
  name: json['name'] as String,
  description: json['discription'] as String,
  cost: (json['cost'] as num).toDouble(),
  type: json['type'] as String,
  unit: json['unit'] as String,
);

Map<String, dynamic> _$MaterialAddToJson(MaterialAdd instance) =>
    <String, dynamic>{
      'name': instance.name,
      'discription': instance.description,
      'cost': instance.cost,
      'type': instance.type,
      'unit': instance.unit,
    };

Material _$MaterialFromJson(Map<String, dynamic> json) => Material(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['discription'] as String,
  cost: (json['cost'] as num).toDouble(),
  type: json['type'] as String,
  unit: json['unit'] as String,
);

Map<String, dynamic> _$MaterialToJson(Material instance) => <String, dynamic>{
  'name': instance.name,
  'discription': instance.description,
  'cost': instance.cost,
  'type': instance.type,
  'unit': instance.unit,
  'id': instance.id,
};
