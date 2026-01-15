import 'package:art_studio_app/models/payments.dart';
import 'package:art_studio_app/models/schedule.dart';
import 'package:art_studio_app/models/status.dart';
import 'package:art_studio_app/objects/status_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orders.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OrderAdd {
  final int userId;
  final int scheduleId;
  final DateTime date;
  @StatusConverter()
  final Status status;

  OrderAdd({
    required this.userId,
    required this.scheduleId,
    required this.date,
    required this.status,
  });
  factory OrderAdd.fromJson(Map<String, dynamic> json) =>
      _$OrderAddFromJson(json);
  Map<String, dynamic> toJson() => _$OrderAddToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Order extends OrderAdd {
  final int id;

  Order({
    required this.id,
    required super.userId,
    required super.scheduleId,
    required super.date,
    required super.status,
  });
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class OrderSession extends Order {
  final ScheduleWorkshop session;

  OrderSession({
    required this.session,
    required super.id,
    required super.userId,
    required super.scheduleId,
    required super.date,
    required super.status,
  });
  factory OrderSession.fromJson(Map<String, dynamic> json) =>
      _$OrderSessionFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$OrderSessionToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class OrderRels extends Order {
  final ScheduleWorkshop session;
  final Payment payment;

  OrderRels({
    required this.session,
    required this.payment,
    required super.id,
    required super.userId,
    required super.scheduleId,
    required super.date,
    required super.status,
  });
  factory OrderRels.fromJson(Map<String, dynamic> json) =>
      _$OrderRelsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$OrderRelsToJson(this);
}
