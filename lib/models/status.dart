enum Status {
  active("активный"),
  unactive("неактивный"),
  canceled("отмененный");

  const Status(this.value);
  final String value;

  static Status fromString(String value) {
    for (var status in Status.values) {
      if (status.value == value) return status;
    }
    throw ArgumentError('Недопустимое значение Status: $value');
  }
}
