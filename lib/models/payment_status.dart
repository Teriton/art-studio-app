enum PaymentStatus {
  paid("активный"),
  unpaid("неактивный");

  const PaymentStatus(this.value);
  final String value;

  static PaymentStatus fromString(String value) {
    for (var status in PaymentStatus.values) {
      if (status.value == value) return status;
    }
    throw ArgumentError('Недопустимое значение PaymentStatus: $value');
  }
}
