// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderAdd _$OrderAddFromJson(Map<String, dynamic> json) => OrderAdd(
  userId: (json['user_id'] as num).toInt(),
  scheduleId: (json['schedule_id'] as num).toInt(),
  date: DateTime.parse(json['date'] as String),
  status: $enumDecode(_$StatusEnumMap, json['status']),
);

Map<String, dynamic> _$OrderAddToJson(OrderAdd instance) => <String, dynamic>{
  'user_id': instance.userId,
  'schedule_id': instance.scheduleId,
  'date': instance.date.toIso8601String(),
  'status': _$StatusEnumMap[instance.status]!,
};

const _$StatusEnumMap = {
  Status.active: 'active',
  Status.unactive: 'unactive',
  Status.canceled: 'canceled',
};

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
  id: (json['id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  scheduleId: (json['schedule_id'] as num).toInt(),
  date: DateTime.parse(json['date'] as String),
  status: $enumDecode(_$StatusEnumMap, json['status']),
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  'user_id': instance.userId,
  'schedule_id': instance.scheduleId,
  'date': instance.date.toIso8601String(),
  'status': _$StatusEnumMap[instance.status]!,
  'id': instance.id,
};

OrderSession _$OrderSessionFromJson(Map<String, dynamic> json) => OrderSession(
  session: ScheduleWorkshop.fromJson(json['session'] as Map<String, dynamic>),
  id: (json['id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  scheduleId: (json['schedule_id'] as num).toInt(),
  date: DateTime.parse(json['date'] as String),
  status: $enumDecode(_$StatusEnumMap, json['status']),
);

Map<String, dynamic> _$OrderSessionToJson(OrderSession instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'schedule_id': instance.scheduleId,
      'date': instance.date.toIso8601String(),
      'status': _$StatusEnumMap[instance.status]!,
      'id': instance.id,
      'session': instance.session,
    };

OrderRels _$OrderRelsFromJson(Map<String, dynamic> json) => OrderRels(
  session: ScheduleWorkshop.fromJson(json['session'] as Map<String, dynamic>),
  payment: Payment.fromJson(json['payment'] as Map<String, dynamic>),
  id: (json['id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  scheduleId: (json['schedule_id'] as num).toInt(),
  date: DateTime.parse(json['date'] as String),
  status: $enumDecode(_$StatusEnumMap, json['status']),
);

Map<String, dynamic> _$OrderRelsToJson(OrderRels instance) => <String, dynamic>{
  'user_id': instance.userId,
  'schedule_id': instance.scheduleId,
  'date': instance.date.toIso8601String(),
  'status': _$StatusEnumMap[instance.status]!,
  'id': instance.id,
  'session': instance.session,
  'payment': instance.payment,
};
