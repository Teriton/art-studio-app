// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_of_materials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetOfMaterialRaw _$SetOfMaterialRawFromJson(Map<String, dynamic> json) =>
    SetOfMaterialRaw(
      workshopId: (json['workshop_id'] as num).toInt(),
      materialId: (json['material_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$SetOfMaterialRawToJson(SetOfMaterialRaw instance) =>
    <String, dynamic>{
      'workshop_id': instance.workshopId,
      'material_id': instance.materialId,
      'quantity': instance.quantity,
    };

SetOfMaterial _$SetOfMaterialFromJson(Map<String, dynamic> json) =>
    SetOfMaterial(
      material: Material.fromJson(json['material'] as Map<String, dynamic>),
      workshopId: (json['workshop_id'] as num).toInt(),
      materialId: (json['material_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$SetOfMaterialToJson(SetOfMaterial instance) =>
    <String, dynamic>{
      'workshop_id': instance.workshopId,
      'material_id': instance.materialId,
      'quantity': instance.quantity,
      'material': instance.material,
    };
