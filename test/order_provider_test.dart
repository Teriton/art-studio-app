import 'package:art_studio_app/providers/order_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Order provider teest", () {
    test("Get orders", () async {
      final container = ProviderContainer();
      final orders = await container.read(orderProvider.future);
      expect(orders.isNotEmpty, true);
    });
    test("Add order", () async {
      final container = ProviderContainer();
      final result = await container
          .read(orderProvider.notifier)
          .orderSession(3);
      expect(result, true);
    });
    test("Cancel order", () async {
      final container = ProviderContainer();
      final result = await container
          .read(orderProvider.notifier)
          .cancelOrder(2);
      expect(result, true);
    });
    test("Refresh orders", () async {
      final container = ProviderContainer();
      container.read(orderProvider.notifier).refresh();
    });
  });
}
