enum PaymentMethod {
  card("карта"),
  cash("налик");

  const PaymentMethod(this.value);
  final String value;

  static PaymentMethod fromString(String value) {
    for (var status in PaymentMethod.values) {
      if (status.value == value) return status;
    }
    throw ArgumentError('Недопустимое значение PaymentStatus: $value');
  }
}
