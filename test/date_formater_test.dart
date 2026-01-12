import 'package:art_studio_app/objects/date_formater.dart';
import 'package:flutter_test/flutter_test.dart';

DateTime getDate() {
  return DateTime(2020, DateTime.february, 14, 16, 30);
}

DateTime getDate2() {
  return DateTime(2020, DateTime.december, 2, 9, 5);
}

void main() {
  group("Formater", () {
    test("Format data less than 10", () {
      final formater = DateFormater();
      final date = getDate();
      final formatedDate = formater.formatDate(date);
      expect(formatedDate, "2020-02-14");
    });
    test("Format data more than 10", () {
      final formater = DateFormater();
      final date = getDate2();
      final formatedDate = formater.formatDate(date);
      expect(formatedDate, "2020-12-02");
    });

    test("Format time less than 10", () {
      final formater = DateFormater();
      final date = getDate();
      final formatedTime = formater.formatTime(date);
      expect(formatedTime, "16:30");
    });
    test("Format time more than 10", () {
      final formater = DateFormater();
      final date = getDate2();
      final formatedTime = formater.formatTime(date);
      expect(formatedTime, "09:05");
    });
  });
}
