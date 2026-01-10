import 'package:json_annotation/json_annotation.dart';

part 'material.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MaterialAdd {
  final String name;
  @JsonKey(name: 'discription')
  final String description;
  final double cost;
  final String type;
  final String unit;

  MaterialAdd({
    required this.name,
    required this.description,
    required this.cost,
    required this.type,
    required this.unit,
  });
  factory MaterialAdd.fromJson(Map<String, dynamic> json) =>
      _$MaterialAddFromJson(json);
  Map<String, dynamic> toJson() => _$MaterialAddToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Material extends MaterialAdd {
  final int id;

  Material({
    required this.id,
    required super.name,
    required super.description,
    required super.cost,
    required super.type,
    required super.unit,
  });

  factory Material.fromJson(Map<String, dynamic> json) =>
      _$MaterialFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$MaterialToJson(this);
}
