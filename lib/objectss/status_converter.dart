// lib/models/status_converter.dart
import 'package:art_studio_app/models/status.dart';
import 'package:json_annotation/json_annotation.dart';

class StatusConverter implements JsonConverter<Status, String> {
  const StatusConverter();

  @override
  Status fromJson(String json) => Status.fromString(json);

  @override
  String toJson(Status status) => status.value;
}
