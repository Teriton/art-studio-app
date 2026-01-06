import 'package:art_studio_app/models/master.dart';
import 'package:art_studio_app/models/status.dart';
import 'package:art_studio_app/objectss/status_converter.dart';
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
