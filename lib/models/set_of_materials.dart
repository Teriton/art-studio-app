import 'package:art_studio_app/models/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_of_materials.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SetOfMaterialRaw {
  final int workshopId;
  final int materialId;
  final int quantity;

  SetOfMaterialRaw({
    required this.workshopId,
    required this.materialId,
    required this.quantity,
  });
  factory SetOfMaterialRaw.fromJson(Map<String, dynamic> json) =>
      _$SetOfMaterialRawFromJson(json);
  Map<String, dynamic> toJson() => _$SetOfMaterialRawToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SetOfMaterial extends SetOfMaterialRaw {
  final Material material;

  SetOfMaterial({
    required this.material,
    required super.workshopId,
    required super.materialId,
    required super.quantity,
  });
  factory SetOfMaterial.fromJson(Map<String, dynamic> json) =>
      _$SetOfMaterialFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SetOfMaterialToJson(this);
}
