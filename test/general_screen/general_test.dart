import 'package:art_studio_app/screens/detailed_workshop.dart';
import 'package:art_studio_app/screens/general.dart';
import 'package:art_studio_app/screens/payment.dart';
import 'package:art_studio_app/screens/welcome.dart';
import 'package:art_studio_app/widgets/general/detailed_order.dart';
import 'package:art_studio_app/widgets/general/orders_list.dart';
import 'package:art_studio_app/widgets/general/profile_page.dart';
import 'package:art_studio_app/widgets/order_card.dart';
import 'package:art_studio_app/widgets/workshop_card.dart';
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

  group("List workshops test", () {
    // Желательно переделать
    testWidgets("Reload workshops", (tester) async {
      await tester.pumpWidget(
        ProviderScope(child: MaterialApp(home: GeneralScreen())),
      );
      await tester.pumpAndSettle();
      await tester.drag(find.byType(RefreshIndicator), const Offset(0, 300));
      await tester.pumpAndSettle();
      expect(find.byType(WorkshopCard), findsWidgets);
    });

    testWidgets("Switch to detailed", (tester) async {
      await tester.pumpWidget(
        ProviderScope(child: MaterialApp(home: GeneralScreen())),
      );
      await tester.pumpAndSettle();
      final item1 = find.widgetWithText(WorkshopCard, "Sosal???");
      expect(item1, findsOneWidget);
      await tester.tap(item1);
      await tester.pumpAndSettle();
      expect(find.byType(DetailedWorkshopScreen), findsOneWidget);
    });
  });
  group("Orders list test", () {
    testWidgets("Orders list loading", (tester) async {
      await tester.pumpWidget(
        ProviderScope(child: MaterialApp(home: GeneralScreen())),
      );
      await tester.pumpAndSettle();
      final ordersButton = find.byIcon(Icons.payment);
      expect(ordersButton, findsOneWidget);
      await tester.tap(ordersButton);
      await tester.pumpAndSettle();
      expect(find.byType(OrdersList), findsOneWidget);
    });
    testWidgets("Detailed opens", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(home: GeneralScreen(initialPageIndex: 1)),
        ),
      );
      await tester.pumpAndSettle();
      final order = find.widgetWithText(
        OrderCard,
        "${OrderCard.textFields["orderInsription"]}2",
      );
      expect(order, findsOneWidget);
      await tester.tap(order);
      await tester.pumpAndSettle();
      expect(find.byType(DetailedOrder), findsOneWidget);
    });
    testWidgets("Delete order", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(home: GeneralScreen(initialPageIndex: 1)),
        ),
      );
      await tester.pumpAndSettle();
      final order = find.widgetWithText(
        OrderCard,
        "${OrderCard.textFields["orderInsription"]}2",
      );
      expect(order, findsOneWidget);
      await tester.tap(order);
      await tester.pumpAndSettle();
      expect(find.byType(DetailedOrder), findsOneWidget);
      final cancelButton = find.widgetWithText(
        ElevatedButton,
        DetailedOrder.textFields['cancel']!,
      );
      expect(cancelButton, findsOneWidget);
      await tester.tap(cancelButton);
      await tester.pumpAndSettle();
      expect(
        find.widgetWithText(
          OrderCard,
          "${OrderCard.textFields["orderInsription"]}2",
        ),
        findsNothing,
      );
    });
    testWidgets("Payment opens", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(home: GeneralScreen(initialPageIndex: 1)),
        ),
      );
      await tester.pumpAndSettle();
      final order = find.widgetWithText(
        OrderCard,
        "${OrderCard.textFields["orderInsription"]}2",
      );
      expect(order, findsOneWidget);
      await tester.tap(order);
      await tester.pumpAndSettle();
      expect(find.byType(DetailedOrder), findsOneWidget);

      final paymentButton = find.widgetWithText(
        ElevatedButton,
        DetailedOrder.textFields["pay"]!,
      );
      expect(paymentButton, findsOneWidget);
      await tester.tap(paymentButton);
      await tester.pumpAndSettle();
      expect(find.byType(PaymentScreen), findsOneWidget);
    });
  });

  group("Profile test", () {
    testWidgets("Profile opens", (tester) async {
      await tester.pumpWidget(
        ProviderScope(child: MaterialApp(home: GeneralScreen())),
      );
      await tester.pumpAndSettle();
      final ordersButton = find.byIcon(Icons.account_box);
      expect(ordersButton, findsOneWidget);
      await tester.tap(ordersButton);
      await tester.pumpAndSettle();
      expect(find.byType(ProfilePage), findsOneWidget);
    });
  });
}
