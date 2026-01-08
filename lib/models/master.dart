import 'package:json_annotation/json_annotation.dart';

part 'master.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MasterAdd {
  final String firstName;
  final String lastName;
  final String specialization;
  @JsonKey(name: 'expirience')
  final int experience;
  final String bio;
  final String image;

  MasterAdd({
    required this.firstName,
    required this.lastName,
    required this.specialization,
    required this.experience,
    required this.bio,
    required this.image,
  });
  factory MasterAdd.fromJson(Map<String, dynamic> json) =>
      _$MasterAddFromJson(json);
  Map<String, dynamic> toJson() => _$MasterAddToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Master extends MasterAdd {
  final int id;

  Master({
    required this.id,
    required super.firstName,
    required super.lastName,
    required super.specialization,
    required super.experience,
    required super.bio,
    required super.image,
  });
  factory Master.fromJson(Map<String, dynamic> json) => _$MasterFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$MasterToJson(this);
}
