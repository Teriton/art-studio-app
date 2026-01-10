import 'package:art_studio_app/models/orders.dart';
import 'package:art_studio_app/models/workshop.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ScheduleAdd {
  final int workshopId;
  final DateTime date;
  final String location;
  @JsonKey(name: 'numberOfSeats')
  final int numberOfSeats;

  ScheduleAdd({
    required this.workshopId,
    required this.date,
    required this.location,
    required this.numberOfSeats,
  });
  factory ScheduleAdd.fromJson(Map<String, dynamic> json) =>
      _$ScheduleAddFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleAddToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Schedule extends ScheduleAdd {
  final int id;

  Schedule({
    required this.id,
    required super.workshopId,
    required super.date,
    required super.location,
    required super.numberOfSeats,
  });
  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ScheduleWorkshop extends Schedule {
  final Workshop workshop;

  ScheduleWorkshop({
    required this.workshop,
    required super.id,
    required super.workshopId,
    required super.date,
    required super.location,
    required super.numberOfSeats,
  });
  factory ScheduleWorkshop.fromJson(Map<String, dynamic> json) =>
      _$ScheduleWorkshopFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ScheduleWorkshopToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ScheduleOrders extends Schedule {
  final List<Order> orders;

  ScheduleOrders({
    required this.orders,
    required super.id,
    required super.workshopId,
    required super.date,
    required super.location,
    required super.numberOfSeats,
  });

  factory ScheduleOrders.fromJson(Map<String, dynamic> json) =>
      _$ScheduleOrdersFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ScheduleOrdersToJson(this);
}
