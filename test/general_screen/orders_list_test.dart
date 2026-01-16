import 'package:art_studio_app/models/orders.dart';
import 'package:art_studio_app/models/payment_method.dart';
import 'package:art_studio_app/models/payment_status.dart';
import 'package:art_studio_app/models/payments.dart';
import 'package:art_studio_app/models/schedule.dart';
import 'package:art_studio_app/models/status.dart';
import 'package:art_studio_app/models/workshop.dart';
import 'package:art_studio_app/screens/general.dart';
import 'package:art_studio_app/widgets/general/detailed_order.dart';
import 'package:art_studio_app/widgets/general/orders_list.dart';
import 'package:art_studio_app/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

List<OrderRels> getOrders() {
  final orders = [
    OrderRels(
      payment: Payment(
        id: 1,
        userId: 1,
        orderId: 1,
        status: PaymentStatus.unpaid,
        fee: 12.00,
        paymentMethod: PaymentMethod.card,
      ),
      session: ScheduleWorkshop(
        id: 1,
        workshopId: 1,
        date: DateTime.now(),
        location: "Лондон",
        numberOfSeats: 100,
        workshop: Workshop(
          id: 1,
          masterId: 1,
          techniqueId: 12,
          title: "Sosal???",
          difficulty: "Sosalno",
          duration: 12,
          fee: 12.22,
          status: Status.active,
          description: "Sloshno strashno virubay",
          image: "Delfin",
        ),
      ),
      id: 1,
      userId: 1,
      scheduleId: 1,
      date: DateTime.now(),
      status: Status.active,
    ),
    OrderRels(
      payment: Payment(
        id: 1,
        userId: 1,
        orderId: 1,
        status: PaymentStatus.unpaid,
        fee: 12.00,
        paymentMethod: PaymentMethod.card,
      ),
      session: ScheduleWorkshop(
        id: 2,
        workshopId: 2,
        date: DateTime.now(),
        location: "Piter",
        numberOfSeats: 12,
        workshop: Workshop(
          id: 32,
          masterId: 93,
          techniqueId: 993,
          title: "Sosal???",
          difficulty: "Sosalno",
          duration: 12,
          fee: 12.22,
          status: Status.active,
          description: "Sloshno strashno virubay",
          image: "Delfin",
        ),
      ),
      id: 1,
      userId: 1,
      scheduleId: 1,
      date: DateTime.now(),
      status: Status.active,
    ),
  ];
  return orders;
}

void main() {
  group("Orders list", () {
    testWidgets("Orders list apears", (tester) async {
      final orders = getOrders();
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: OrdersList(orders: orders)),
          ),
        ),
      );

      expect(find.byType(OrdersList), findsOneWidget);
    });
    testWidgets("Orders cards apears", (tester) async {
      final orders = getOrders();

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: OrdersList(orders: orders)),
          ),
        ),
      );

      expect(find.byType(OrderCard), findsWidgets);
    });
    testWidgets("Open actions and detailes", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(home: GeneralScreen(initialPageIndex: 1)),
        ),
      );
      await tester.pumpAndSettle();
      final item1 = find.widgetWithText(
        OrderCard,
        "${OrderCard.textFields["orderInsription"]}${1}",
      );
      expect(item1, findsOneWidget);
      await tester.tap(item1);
      await tester.pumpAndSettle();
      expect(find.byType(DetailedOrder), findsOneWidget);
    });
  });
}
