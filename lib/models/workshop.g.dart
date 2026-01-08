// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workshop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkshopAdd _$WorkshopAddFromJson(Map<String, dynamic> json) => WorkshopAdd(
  masterId: (json['master_id'] as num).toInt(),
  techniqueId: (json['technique_id'] as num).toInt(),
  title: json['title'] as String,
  difficulty: json['dificulty'] as String,
  duration: (json['duration'] as num).toInt(),
  fee: (json['fee'] as num).toDouble(),
  status: const StatusConverter().fromJson(json['status'] as String),
  description: json['description'] as String,
  image: json['image'] as String,
);

Map<String, dynamic> _$WorkshopAddToJson(WorkshopAdd instance) =>
    <String, dynamic>{
      'master_id': instance.masterId,
      'technique_id': instance.techniqueId,
      'title': instance.title,
      'dificulty': instance.difficulty,
      'duration': instance.duration,
      'fee': instance.fee,
      'status': const StatusConverter().toJson(instance.status),
      'description': instance.description,
      'image': instance.image,
    };

Workshop _$WorkshopFromJson(Map<String, dynamic> json) => Workshop(
  id: (json['id'] as num).toInt(),
  masterId: (json['master_id'] as num).toInt(),
  techniqueId: (json['technique_id'] as num).toInt(),
  title: json['title'] as String,
  difficulty: json['dificulty'] as String,
  duration: (json['duration'] as num).toInt(),
  fee: (json['fee'] as num).toDouble(),
  status: const StatusConverter().fromJson(json['status'] as String),
  description: json['description'] as String,
  image: json['image'] as String,
);

Map<String, dynamic> _$WorkshopToJson(Workshop instance) => <String, dynamic>{
  'master_id': instance.masterId,
  'technique_id': instance.techniqueId,
  'title': instance.title,
  'dificulty': instance.difficulty,
  'duration': instance.duration,
  'fee': instance.fee,
  'status': const StatusConverter().toJson(instance.status),
  'description': instance.description,
  'image': instance.image,
  'id': instance.id,
};

WorkshopMaster _$WorkshopMasterFromJson(Map<String, dynamic> json) =>
    WorkshopMaster(
      master: Master.fromJson(json['master'] as Map<String, dynamic>),
      id: (json['id'] as num).toInt(),
      masterId: (json['master_id'] as num).toInt(),
      techniqueId: (json['technique_id'] as num).toInt(),
      title: json['title'] as String,
      difficulty: json['dificulty'] as String,
      duration: (json['duration'] as num).toInt(),
      fee: (json['fee'] as num).toDouble(),
      status: const StatusConverter().fromJson(json['status'] as String),
      description: json['description'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$WorkshopMasterToJson(WorkshopMaster instance) =>
    <String, dynamic>{
      'master_id': instance.masterId,
      'technique_id': instance.techniqueId,
      'title': instance.title,
      'dificulty': instance.difficulty,
      'duration': instance.duration,
      'fee': instance.fee,
      'status': const StatusConverter().toJson(instance.status),
      'description': instance.description,
      'image': instance.image,
      'id': instance.id,
      'master': instance.master,
    };

WorkshopRel _$WorkshopRelFromJson(Map<String, dynamic> json) => WorkshopRel(
  master: Master.fromJson(json['master'] as Map<String, dynamic>),
  technique: Technique.fromJson(json['technique'] as Map<String, dynamic>),
  id: (json['id'] as num).toInt(),
  masterId: (json['master_id'] as num).toInt(),
  techniqueId: (json['technique_id'] as num).toInt(),
  title: json['title'] as String,
  difficulty: json['dificulty'] as String,
  duration: (json['duration'] as num).toInt(),
  fee: (json['fee'] as num).toDouble(),
  status: const StatusConverter().fromJson(json['status'] as String),
  description: json['description'] as String,
  image: json['image'] as String,
);

Map<String, dynamic> _$WorkshopRelToJson(WorkshopRel instance) =>
    <String, dynamic>{
      'master_id': instance.masterId,
      'technique_id': instance.techniqueId,
      'title': instance.title,
      'dificulty': instance.difficulty,
      'duration': instance.duration,
      'fee': instance.fee,
      'status': const StatusConverter().toJson(instance.status),
      'description': instance.description,
      'image': instance.image,
      'id': instance.id,
      'master': instance.master,
      'technique': instance.technique,
    };
