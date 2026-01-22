import 'package:art_studio_app/screens/payment.dart';
import 'package:art_studio_app/widgets/payment/card_info.dart';
import 'package:art_studio_app/widgets/payment/cash_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../general_screen/orders_list_test.dart';

void main() {
  group("Payment screen test", () {
    testWidgets("Apears", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(home: PaymentScreen(order: getOrders()[0])),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(PaymentScreen), findsOneWidget);
    });
    testWidgets("Chose method", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(home: PaymentScreen(order: getOrders()[0])),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.text(PaymentScreen.textFields["choseMethodTitle"]!),
        findsOne,
      );
    });
    testWidgets("Methods display", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(home: PaymentScreen(order: getOrders()[0])),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.widgetWithText(ElevatedButton, PaymentScreen.textFields["cash"]!),
        findsOne,
      );
      expect(
        find.widgetWithText(ElevatedButton, PaymentScreen.textFields["card"]!),
        findsOne,
      );
    });
    testWidgets("Cash display", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(home: PaymentScreen(order: getOrders()[0])),
        ),
      );
      await tester.pumpAndSettle();
      final cashButton = find.widgetWithText(
        ElevatedButton,
        PaymentScreen.textFields["cash"]!,
      );
      expect(cashButton, findsOne);
      await tester.tap(cashButton);
      await tester.pumpAndSettle();
      expect(find.byType(CashInfo), findsOneWidget);
    });
    testWidgets("Card display", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(home: PaymentScreen(order: getOrders()[0])),
        ),
      );
      await tester.pumpAndSettle();
      final cardButton = find.widgetWithText(
        ElevatedButton,
        PaymentScreen.textFields["card"]!,
      );
      expect(cardButton, findsOne);
      await tester.tap(cardButton);
      await tester.pumpAndSettle();
      expect(find.byType(CardInfo), findsOneWidget);
    });
    testWidgets("Confirm payment", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(home: PaymentScreen(order: getOrders()[0])),
        ),
      );
      await tester.pumpAndSettle();
      final confirmButton = find.widgetWithText(
        OutlinedButton,
        PaymentScreen.textFields["confirm"]!,
      );
      expect(confirmButton, findsOneWidget);
      await tester.tap(
        find.widgetWithText(ElevatedButton, PaymentScreen.textFields["card"]!),
      );
      await tester.pumpAndSettle();
      expect(confirmButton, findsOneWidget);
    });
  });
}
