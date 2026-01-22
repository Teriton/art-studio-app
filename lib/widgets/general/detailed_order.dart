import 'package:art_studio_app/models/orders.dart';
import 'package:art_studio_app/models/payment_method.dart';
import 'package:art_studio_app/models/payment_status.dart';
import 'package:art_studio_app/objects/date_formater.dart';
import 'package:art_studio_app/providers/order_provider.dart';
import 'package:art_studio_app/screens/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailedOrder extends ConsumerStatefulWidget {
  const DetailedOrder({super.key, required this.order, context})
    : parentContext = context;

  static const textFields = <String, String>{
    "titleInscription": "Мастеркласс:",
    "orderInsription": "Заказ №",
    "status": "Статус:",
    "place": "Место проведения:",
    "date": "Дата:",
    "price": "Цена: ",
    "currency": "руб.",
    "duration": "Продолжительность:",
    "timeUnit": "мин.",
    "unpaid": "не оплачен",
    "paid": "оплачен",
    "pay": "Оплатить",
    "cancel": "Отменить",
    "cancelError": "Ошибка при удалении заказа",
  };
  final OrderRels order;
  final BuildContext? parentContext;

  @override
  ConsumerState<DetailedOrder> createState() => _DetailedOrderState();
}

class _DetailedOrderState extends ConsumerState<DetailedOrder> {
  final _formater = DateFormater();

  bool _isLoading = false;

  void _cancelOrder() async {
    setState(() {
      _isLoading = true;
    });
    final result = await ref
        .read(orderProvider.notifier)
        .cancelOrder(widget.order.id);

    if (mounted) Navigator.pop(context);
    if (result == false &&
        widget.parentContext != null &&
        widget.parentContext!.mounted) {
      ScaffoldMessenger.of(widget.parentContext!).clearSnackBars();
      ScaffoldMessenger.of(widget.parentContext!).showSnackBar(
        SnackBar(content: Text(DetailedOrder.textFields["cancelError"]!)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: .infinity,
      child: Column(
        mainAxisSize: .min,
        children: [
          Text(
            style: Theme.of(context).textTheme.titleLarge,
            "${DetailedOrder.textFields["orderInsription"]}${widget.order.id}",
          ),
          SizedBox(height: 14),
          OrderLine(
            title: "${DetailedOrder.textFields["titleInscription"]} ",
            content: widget.order.session.workshop.title,
          ),
          OrderLine(
            title: "${DetailedOrder.textFields["duration"]}",
            content:
                " ${widget.order.session.workshop.duration} ${DetailedOrder.textFields["timeUnit"]}",
          ),
          OrderLine(
            title: "${DetailedOrder.textFields["place"]}",
            content: " ${widget.order.session.location}",
          ),
          OrderLine(
            title: "${DetailedOrder.textFields["date"]} ",
            content:
                "${_formater.formatDate(widget.order.session.date)} ${_formater.formatTime(widget.order.session.date)}",
          ),
          SizedBox(height: 36),
          Row(
            mainAxisAlignment: .spaceAround,
            children: [
              if (widget.order.payment.status != PaymentStatus.paid)
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => PaymentScreen(order: widget.order),
                      ),
                    );
                  },
                  child: Text(DetailedOrder.textFields["pay"]!),
                ),
              if (widget.order.payment.status != PaymentStatus.paid ||
                  widget.order.payment.paymentMethod != PaymentMethod.card)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: _isLoading ? () {} : _cancelOrder,
                  child: _isLoading
                      ? CircularProgressIndicator()
                      : Text(
                          DetailedOrder.textFields["cancel"]!,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class OrderLine extends StatelessWidget {
  const OrderLine({super.key, required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: .infinity,
      child: Text.rich(
        style: Theme.of(context).textTheme.bodyLarge,
        TextSpan(
          children: [
            TextSpan(
              style: const TextStyle(fontWeight: .bold),
              text: title,
            ),
            TextSpan(text: content),
          ],
        ),
      ),
    );
  }
}
