import 'package:art_studio_app/models/orders.dart';
import 'package:art_studio_app/models/payment_method.dart';
import 'package:art_studio_app/models/payment_status.dart';
import 'package:art_studio_app/models/user.dart';
import 'package:art_studio_app/objects/payment_method_converter.dart';
import 'package:art_studio_app/objects/payment_status_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payments.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PaymentAdd {
  final int userId;
  final int orderId;
  @PaymentStatusConverter()
  final PaymentStatus status;
  final double fee;
  @PaymentMethodConverter()
  final PaymentMethod paymentMethod;

  PaymentAdd({
    required this.userId,
    required this.orderId,
    required this.status,
    required this.fee,
    required this.paymentMethod,
  });
  factory PaymentAdd.fromJson(Map<String, dynamic> json) =>
      _$PaymentAddFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentAddToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Payment extends PaymentAdd {
  final int id;

  Payment({
    required this.id,
    required super.userId,
    required super.orderId,
    required super.status,
    required super.fee,
    required super.paymentMethod,
  });
  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PaymentRel extends Payment {
  final User user;
  final Order order;

  PaymentRel({
    required this.user,
    required this.order,
    required super.id,
    required super.userId,
    required super.orderId,
    required super.status,
    required super.fee,
    required super.paymentMethod,
  });
  factory PaymentRel.fromJson(Map<String, dynamic> json) =>
      _$PaymentRelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PaymentRelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PaymentOrder extends Payment {
  final OrderSession order;

  PaymentOrder({
    required this.order,
    required super.id,
    required super.userId,
    required super.orderId,
    required super.status,
    required super.fee,
    required super.paymentMethod,
  });
  factory PaymentOrder.fromJson(Map<String, dynamic> json) =>
      _$PaymentOrderFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PaymentOrderToJson(this);
}
