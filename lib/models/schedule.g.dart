// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleAdd _$ScheduleAddFromJson(Map<String, dynamic> json) => ScheduleAdd(
  workshopId: (json['workshop_id'] as num).toInt(),
  date: DateTime.parse(json['date'] as String),
  location: json['location'] as String,
  numberOfSeats: (json['numberOfSeats'] as num).toInt(),
);

Map<String, dynamic> _$ScheduleAddToJson(ScheduleAdd instance) =>
    <String, dynamic>{
      'workshop_id': instance.workshopId,
      'date': instance.date.toIso8601String(),
      'location': instance.location,
      'numberOfSeats': instance.numberOfSeats,
    };

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule(
  id: (json['id'] as num).toInt(),
  workshopId: (json['workshop_id'] as num).toInt(),
  date: DateTime.parse(json['date'] as String),
  location: json['location'] as String,
  numberOfSeats: (json['numberOfSeats'] as num).toInt(),
);

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
  'workshop_id': instance.workshopId,
  'date': instance.date.toIso8601String(),
  'location': instance.location,
  'numberOfSeats': instance.numberOfSeats,
  'id': instance.id,
};

ScheduleWorkshop _$ScheduleWorkshopFromJson(Map<String, dynamic> json) =>
    ScheduleWorkshop(
      workshop: Workshop.fromJson(json['workshop'] as Map<String, dynamic>),
      id: (json['id'] as num).toInt(),
      workshopId: (json['workshop_id'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      location: json['location'] as String,
      numberOfSeats: (json['numberOfSeats'] as num).toInt(),
    );

Map<String, dynamic> _$ScheduleWorkshopToJson(ScheduleWorkshop instance) =>
    <String, dynamic>{
      'workshop_id': instance.workshopId,
      'date': instance.date.toIso8601String(),
      'location': instance.location,
      'numberOfSeats': instance.numberOfSeats,
      'id': instance.id,
      'workshop': instance.workshop,
    };

ScheduleOrders _$ScheduleOrdersFromJson(Map<String, dynamic> json) =>
    ScheduleOrders(
      orders: (json['orders'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num).toInt(),
      workshopId: (json['workshop_id'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      location: json['location'] as String,
      numberOfSeats: (json['numberOfSeats'] as num).toInt(),
    );

Map<String, dynamic> _$ScheduleOrdersToJson(ScheduleOrders instance) =>
    <String, dynamic>{
      'workshop_id': instance.workshopId,
      'date': instance.date.toIso8601String(),
      'location': instance.location,
      'numberOfSeats': instance.numberOfSeats,
      'id': instance.id,
      'orders': instance.orders,
    };
