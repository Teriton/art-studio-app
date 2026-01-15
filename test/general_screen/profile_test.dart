import 'package:art_studio_app/widgets/general/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Profile test", () {
    testWidgets("Profile is apeared", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(home: Scaffold(body: ProfilePage())),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(ProfilePage), findsOneWidget);
    });
  });
}
