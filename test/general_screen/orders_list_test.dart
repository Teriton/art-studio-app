import 'package:art_studio_app/models/orders.dart';
import 'package:art_studio_app/models/schedule.dart';
import 'package:art_studio_app/models/status.dart';
import 'package:art_studio_app/models/workshop.dart';
import 'package:art_studio_app/widgets/general/orders_list.dart';
import 'package:art_studio_app/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

List<OrderSession> getOrders() {
  final orders = [
    OrderSession(
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
    OrderSession(
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
  });
}
