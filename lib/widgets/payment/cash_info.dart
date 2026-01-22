import 'package:art_studio_app/models/orders.dart';
import 'package:art_studio_app/models/payment_method.dart';
import 'package:art_studio_app/providers/order_provider.dart';
import 'package:art_studio_app/screens/general.dart';
import 'package:art_studio_app/screens/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CashInfo extends ConsumerStatefulWidget {
  const CashInfo({super.key, required this.order, required context})
    : parentContext = context;

  final BuildContext? parentContext;
  final OrderRels order;

  static const textFields = {
    "info":
        "Оплата будует производится наличными или картой на месте проведения мастеркласса.",
  };

  @override
  ConsumerState<CashInfo> createState() => _CashInfoState();
}

class _CashInfoState extends ConsumerState<CashInfo> {
  void _confirmPayment() async {
    await ref
        .read(orderProvider.notifier)
        .payForOrder(widget.order.id, PaymentMethod.cash);
    Navigator.of(widget.parentContext!).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => GeneralScreen(initialPageIndex: 1)),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(CashInfo.textFields["info"]!, textAlign: .justify),
        OutlinedButton(
          onPressed: () {
            ref.read(orderProvider.notifier).payForOrder(1, PaymentMethod.cash);
            if (widget.parentContext != null) {
              _confirmPayment();
            }
          },
          child: Text(PaymentScreen.textFields['confirm']!),
        ),
      ],
    );
  }
}
