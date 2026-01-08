import 'package:art_studio_app/screens/general.dart';
import 'package:art_studio_app/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Geneal screen", () {
    testWidgets("Back button is absent", (tester) async {
      await tester.pumpWidget(
        ProviderScope(child: MaterialApp(home: GeneralScreen())),
      );
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.arrow_back), findsNothing);
    });
    testWidgets("Naigation bar elements", (tester) async {
      await tester.pumpWidget(
        ProviderScope(child: MaterialApp(home: GeneralScreen())),
      );
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.list), findsOneWidget);
      expect(find.byIcon(Icons.payment), findsOneWidget);
      expect(find.byIcon(Icons.account_box), findsOneWidget);
    });
    testWidgets("Test tabs", (tester) async {
      await tester.pumpWidget(
        ProviderScope(child: MaterialApp(home: GeneralScreen())),
      );
      await tester.pumpAndSettle();
      final ordersButton = find.byIcon(Icons.payment);
      expect(ordersButton, findsOneWidget);
      final profileButton = find.byIcon(Icons.account_box);
      expect(profileButton, findsOneWidget);
      final workshopsButton = find.byIcon(Icons.list);
      expect(workshopsButton, findsOneWidget);

      await tester.tap(ordersButton);
      await tester.pumpAndSettle();
      expect(find.widgetWithText(AppBar, "Заказы"), findsOneWidget);
      await tester.tap(profileButton);
      await tester.pumpAndSettle();
      expect(find.widgetWithText(AppBar, "Профиль"), findsOneWidget);
      await tester.tap(workshopsButton);
      await tester.pumpAndSettle();
      expect(find.widgetWithText(AppBar, "Мастерклассы"), findsOneWidget);
    });

    testWidgets("Back to welcome", (tester) async {
      await tester.pumpWidget(
        ProviderScope(child: MaterialApp(home: GeneralScreen())),
      );
      await tester.pumpAndSettle();
      final profileButton = find.byIcon(Icons.account_box);
      expect(profileButton, findsOneWidget);
      await tester.tap(profileButton);
      await tester.pumpAndSettle();
      final logoutButton = find.widgetWithIcon(IconButton, Icons.logout);
      expect(logoutButton, findsOneWidget);
      await tester.tap(logoutButton);
      await tester.pumpAndSettle();
      expect(find.byType(WelcomeScreen), findsOneWidget);
    });
  });
}
