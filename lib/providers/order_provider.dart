import 'dart:async';

import 'package:art_studio_app/models/orders.dart';
import 'package:art_studio_app/models/payment_method.dart';
import 'package:art_studio_app/providers/workshop_api_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderProvider =
    AsyncNotifierProvider.autoDispose<OrderNotifier, List<OrderRels>>(
      OrderNotifier.new,
    );

class OrderNotifier extends AutoDisposeAsyncNotifier<List<OrderRels>> {
  @override
  FutureOr<List<OrderRels>> build() async {
    final repo = await ref.read(workshopRepositoryProvider.future);
    final orders = await repo.getOrders();
    if (orders != null) {
      return orders;
    }
    return [];
  }

  Future<bool> orderSession(int id) async {
    final repo = await ref.read(workshopRepositoryProvider.future);
    final result = await repo.orderSession(id);
    return await _refreshIfResultTrueAndReturnResult(result);
  }

  Future<bool> cancelOrder(int id) async {
    final repo = await ref.read(workshopRepositoryProvider.future);
    final result = await repo.cancelOrder(id);
    return await _refreshIfResultTrueAndReturnResult(result);
  }

  Future<bool> _refreshIfResultTrueAndReturnResult(bool result) async {
    if (result == true) {
      await refresh();
      return true;
    }
    return false;
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final repo = await ref.read(workshopRepositoryProvider.future);
    final orders = await repo.getOrders();
    if (orders != null) {
      state = AsyncValue.data(orders);
      return;
    }
    state = AsyncValue.error("Не удалось получить заказы", StackTrace.current);
  }

  Future<bool> payForOrder(int id, PaymentMethod paymentMethod) async {
    final repo = await ref.read(workshopRepositoryProvider.future);
    final result = await repo.payForOrder(id, paymentMethod);
    return await _refreshIfResultTrueAndReturnResult(result);
  }
}
