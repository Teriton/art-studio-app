import 'package:art_studio_app/mocks/workshop_repository_moc.dart';
import 'package:art_studio_app/models/orders.dart';
import 'package:art_studio_app/widgets/general/orders_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

Future<List<OrderSession>> getOrders() async {
  final repo = WorkshopRepositoryMock();
  final orders = await repo.getOrders();
  return orders!;
}

void main() {
  group("Orders list", () async {
    final orders = await getOrders();
    testWidgets("Orders list apears", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: OrdersList(orders: orders)),
          ),
        ),
      );

      expect(find.byType(OrdersList), findsOneWidget);
    });
  });
}
