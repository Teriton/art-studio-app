import 'package:art_studio_app/models/master.dart';
import 'package:art_studio_app/models/schedule.dart';
import 'package:art_studio_app/models/set_of_materials.dart';
import 'package:art_studio_app/models/status.dart';
import 'package:art_studio_app/models/technique.dart';
import 'package:art_studio_app/objects/status_converter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'workshop.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WorkshopAdd {
  final int masterId;
  final int techniqueId;
  final String title;
  @JsonKey(name: 'dificulty')
  final String difficulty;
  final int duration;
  final double fee;
  @StatusConverter()
  final Status status;
  final String description;
  final String image;

  WorkshopAdd({
    required this.masterId,
    required this.techniqueId,
    required this.title,
    required this.difficulty,
    required this.duration,
    required this.fee,
    required this.status,
    required this.description,
    required this.image,
  });
  factory WorkshopAdd.fromJson(Map<String, dynamic> json) =>
      _$WorkshopAddFromJson(json);
  Map<String, dynamic> toJson() => _$WorkshopAddToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Workshop extends WorkshopAdd {
  final int id;

  Workshop({
    required this.id,
    required super.masterId,
    required super.techniqueId,
    required super.title,
    required super.difficulty,
    required super.duration,
    required super.fee,
    required super.status,
    required super.description,
    required super.image,
  });

  factory Workshop.fromJson(Map<String, dynamic> json) =>
      _$WorkshopFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$WorkshopToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WorkshopMaster extends Workshop {
  final Master master;

  WorkshopMaster({
    required this.master,
    required super.id,
    required super.masterId,
    required super.techniqueId,
    required super.title,
    required super.difficulty,
    required super.duration,
    required super.fee,
    required super.status,
    required super.description,
    required super.image,
  });
  factory WorkshopMaster.fromJson(Map<String, dynamic> json) =>
      _$WorkshopMasterFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$WorkshopMasterToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WorkshopRel extends Workshop {
  final Master master;
  final Technique technique;

  WorkshopRel({
    required this.master,
    required this.technique,
    required super.id,
    required super.masterId,
    required super.techniqueId,
    required super.title,
    required super.difficulty,
    required super.duration,
    required super.fee,
    required super.status,
    required super.description,
    required super.image,
  });
  factory WorkshopRel.fromJson(Map<String, dynamic> json) =>
      _$WorkshopRelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$WorkshopRelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WorkshopSetsOfMaterial extends Workshop {
  final List<SetOfMaterial> setsOfMaterials;

  WorkshopSetsOfMaterial({
    required this.setsOfMaterials,
    required super.id,
    required super.masterId,
    required super.techniqueId,
    required super.title,
    required super.difficulty,
    required super.duration,
    required super.fee,
    required super.status,
    required super.description,
    required super.image,
  });
  factory WorkshopSetsOfMaterial.fromJson(Map<String, dynamic> json) =>
      _$WorkshopSetsOfMaterialFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$WorkshopSetsOfMaterialToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WorkshopSessions extends Workshop {
  final List<Schedule> sessions;

  WorkshopSessions({
    required this.sessions,
    required super.id,
    required super.masterId,
    required super.techniqueId,
    required super.title,
    required super.difficulty,
    required super.duration,
    required super.fee,
    required super.status,
    required super.description,
    required super.image,
  });
  factory WorkshopSessions.fromJson(Map<String, dynamic> json) =>
      _$WorkshopSessionsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$WorkshopSessionsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WorkshopAllRel extends Workshop {
  final Master master;
  final Technique technique;
  final List<SetOfMaterial> setsOfMaterial;
  final List<Schedule> sessions;

  WorkshopAllRel({
    required this.master,
    required this.technique,
    required this.setsOfMaterial,
    required this.sessions,
    required super.id,
    required super.masterId,
    required super.techniqueId,
    required super.title,
    required super.difficulty,
    required super.duration,
    required super.fee,
    required super.status,
    required super.description,
    required super.image,
  });
  factory WorkshopAllRel.fromJson(Map<String, dynamic> json) =>
      _$WorkshopAllRelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$WorkshopAllRelToJson(this);
}
