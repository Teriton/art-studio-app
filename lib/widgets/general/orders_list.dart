import 'package:art_studio_app/models/orders.dart';
import 'package:art_studio_app/widgets/order_card.dart';
import 'package:flutter/material.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key, required this.orders});

  final List<OrderSession> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: orders.length,
      separatorBuilder: (ctx, index) {
        return SizedBox(height: 6);
      },
      itemBuilder: (ctx, index) {
        return OrderCard(order: orders[index], key: ValueKey(orders[index].id));
      },
    );
  }
}
