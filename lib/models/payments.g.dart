// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentAdd _$PaymentAddFromJson(Map<String, dynamic> json) => PaymentAdd(
  userId: (json['user_id'] as num).toInt(),
  orderId: (json['order_id'] as num).toInt(),
  status: $enumDecode(_$PaymentStatusEnumMap, json['status']),
  fee: (json['fee'] as num).toDouble(),
  paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['payment_method']),
);

Map<String, dynamic> _$PaymentAddToJson(PaymentAdd instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'order_id': instance.orderId,
      'status': _$PaymentStatusEnumMap[instance.status]!,
      'fee': instance.fee,
      'payment_method': _$PaymentMethodEnumMap[instance.paymentMethod]!,
    };

const _$PaymentStatusEnumMap = {
  PaymentStatus.paid: 'paid',
  PaymentStatus.unpaid: 'unpaid',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.card: 'card',
  PaymentMethod.cash: 'cash',
};

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
  id: (json['id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  orderId: (json['order_id'] as num).toInt(),
  status: $enumDecode(_$PaymentStatusEnumMap, json['status']),
  fee: (json['fee'] as num).toDouble(),
  paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['payment_method']),
);

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
  'user_id': instance.userId,
  'order_id': instance.orderId,
  'status': _$PaymentStatusEnumMap[instance.status]!,
  'fee': instance.fee,
  'payment_method': _$PaymentMethodEnumMap[instance.paymentMethod]!,
  'id': instance.id,
};

PaymentRel _$PaymentRelFromJson(Map<String, dynamic> json) => PaymentRel(
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  order: Order.fromJson(json['order'] as Map<String, dynamic>),
  id: (json['id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  orderId: (json['order_id'] as num).toInt(),
  status: $enumDecode(_$PaymentStatusEnumMap, json['status']),
  fee: (json['fee'] as num).toDouble(),
  paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['payment_method']),
);

Map<String, dynamic> _$PaymentRelToJson(PaymentRel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'order_id': instance.orderId,
      'status': _$PaymentStatusEnumMap[instance.status]!,
      'fee': instance.fee,
      'payment_method': _$PaymentMethodEnumMap[instance.paymentMethod]!,
      'id': instance.id,
      'user': instance.user,
      'order': instance.order,
    };

PaymentOrder _$PaymentOrderFromJson(Map<String, dynamic> json) => PaymentOrder(
  order: OrderSession.fromJson(json['order'] as Map<String, dynamic>),
  id: (json['id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  orderId: (json['order_id'] as num).toInt(),
  status: $enumDecode(_$PaymentStatusEnumMap, json['status']),
  fee: (json['fee'] as num).toDouble(),
  paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['payment_method']),
);

Map<String, dynamic> _$PaymentOrderToJson(PaymentOrder instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'order_id': instance.orderId,
      'status': _$PaymentStatusEnumMap[instance.status]!,
      'fee': instance.fee,
      'payment_method': _$PaymentMethodEnumMap[instance.paymentMethod]!,
      'id': instance.id,
      'order': instance.order,
    };
