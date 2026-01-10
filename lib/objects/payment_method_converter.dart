// lib/models/status_converter.dart
import 'package:art_studio_app/models/payment_method.dart';
import 'package:json_annotation/json_annotation.dart';

class PaymentMethodConverter implements JsonConverter<PaymentMethod, String> {
  const PaymentMethodConverter();

  @override
  PaymentMethod fromJson(String json) => PaymentMethod.fromString(json);

  @override
  String toJson(PaymentMethod status) => status.value;
}
