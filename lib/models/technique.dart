import 'package:art_studio_app/models/workshop.dart';
import 'package:json_annotation/json_annotation.dart';

part 'technique.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TechniqueAdd {
  final String name;
  @JsonKey(name: 'discription')
  final String description;

  TechniqueAdd({required this.name, required this.description});
  factory TechniqueAdd.fromJson(Map<String, dynamic> json) =>
      _$TechniqueAddFromJson(json);
  Map<String, dynamic> toJson() => _$TechniqueAddToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Technique extends TechniqueAdd {
  final int id;

  Technique({
    required this.id,
    required super.name,
    required super.description,
  });

  factory Technique.fromJson(Map<String, dynamic> json) =>
      _$TechniqueFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TechniqueToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class TechniqueWorkshops extends Technique {
  final List<Workshop> workshops;

  TechniqueWorkshops({
    required this.workshops,
    required super.id,
    required super.name,
    required super.description,
  });
  factory TechniqueWorkshops.fromJson(Map<String, dynamic> json) =>
      _$TechniqueWorkshopsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TechniqueWorkshopsToJson(this);
}
