import 'package:art_studio_app/main.dart';
import 'package:art_studio_app/screens/welcome.dart';
import 'package:art_studio_app/widgets/detailed/sessions_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Sessions section test", () {
    testWidgets("Test is going right", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(home: Scaffold(body: SessionsSection())),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(SessionsSection), findsOneWidget);
    });
  });
}
