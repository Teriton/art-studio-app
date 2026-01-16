import 'package:art_studio_app/objects/date_formater.dart';
import 'package:art_studio_app/widgets/general/detailed_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'orders_list_test.dart';

void main() {
  group("Detailed order", () {
    testWidgets("Apears", (tester) async {
      final order = getOrders()[0];
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: DetailedOrder(order: order)),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.text("${DetailedOrder.textFields["orderInsription"]}${order.id}"),
        findsOne,
      );
    });
    testWidgets("Workshop title", (tester) async {
      final order = getOrders()[0];
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: DetailedOrder(order: order)),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.text(
          "${DetailedOrder.textFields["titleInscription"]} ${order.session.workshop.title}",
        ),
        findsOne,
      );
    });
    testWidgets("Duration title", (tester) async {
      final order = getOrders()[0];
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: DetailedOrder(order: order)),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.text(
          "${DetailedOrder.textFields["duration"]} ${order.session.workshop.duration} ${DetailedOrder.textFields["timeUnit"]}",
        ),
        findsOne,
      );
    });
    testWidgets("Location line", (tester) async {
      final order = getOrders()[0];
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: DetailedOrder(order: order)),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.text(
          "${DetailedOrder.textFields["place"]} ${order.session.location}",
        ),
        findsOne,
      );
    });
    testWidgets("Date line", (tester) async {
      final order = getOrders()[0];
      final formater = DateFormater();
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: DetailedOrder(order: order)),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.text(
          "${DetailedOrder.textFields["date"]} ${formater.formatDate(order.session.date)} ${formater.formatTime(order.session.date)}",
        ),
        findsOne,
      );
    });
    testWidgets("Buttons apear", (tester) async {
      final order = getOrders()[0];
      final formater = DateFormater();
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: DetailedOrder(order: order)),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.widgetWithText(ElevatedButton, DetailedOrder.textFields["pay"]!),
        findsOneWidget,
      );
      expect(
        find.widgetWithText(
          ElevatedButton,
          DetailedOrder.textFields["cancel"]!,
        ),
        findsOneWidget,
      );
    });
  });
}
