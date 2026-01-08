import 'package:art_studio_app/config/config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Config test", () {
    test("Test isTest", () {
      expect(AppConfig.isTest, true);
      expect(AppConfig.isDevelopment, false);
    });
  });
}
