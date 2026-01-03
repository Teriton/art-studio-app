// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:art_studio_app/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Welcome screen", () {
    testWidgets("Has a background", (tester) async {
      await tester.pumpWidget(const WelcomeScreen());
      final imageFiner = find.image(AssetImage("assets/images/bg1.jpg"));

      expect(imageFiner, findsOneWidget);
    });
  });
}
