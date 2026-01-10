// lib/models/status_converter.dart
import 'package:art_studio_app/models/payment_status.dart';
import 'package:json_annotation/json_annotation.dart';

class PaymentStatusConverter implements JsonConverter<PaymentStatus, String> {
  const PaymentStatusConverter();

  @override
  PaymentStatus fromJson(String json) => PaymentStatus.fromString(json);

  @override
  String toJson(PaymentStatus status) => status.value;
}
