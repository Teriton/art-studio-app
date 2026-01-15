import 'package:art_studio_app/models/orders.dart';
import 'package:flutter/material.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key, required this.orders});

  final List<OrderSession> orders;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [for (var order in orders) Text(order.session.workshop.title)],
    );
  }
}
