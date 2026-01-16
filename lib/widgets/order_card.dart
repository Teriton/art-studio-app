import 'package:art_studio_app/models/orders.dart';
import 'package:art_studio_app/models/payment_status.dart';
import 'package:art_studio_app/providers/date_formater_provider.dart';
import 'package:art_studio_app/widgets/general/detailed_order.dart';
import 'package:art_studio_app/widgets/tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderCard extends ConsumerWidget {
  const OrderCard({super.key, required this.order});

  static const textFields = <String, String>{
    "titleInscription": "Мастеркласс: ",
    "orderInsription": "Заказ №",
    "status": "Статус:",
    "place": "Место проведения:",
    "price": "Цена: ",
    "currency": "руб.",
    "time": "Время",
    "timeUnit": "мин.",
    "unpaid": "не оплачен",
    "paid": "оплачен",
  };

  final OrderRels order;

  void _openDetailedOrder(BuildContext ctx) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: ctx,
      builder: (ctx) {
        return Padding(
          padding: .all(8),
          child: DetailedOrder(order: order),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formater = ref.read(dateFormaterProvider);
    return SizedBox(
      height: 160,
      width: .infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
        clipBehavior: .hardEdge,
        child: InkWell(
          onTap: () => _openDetailedOrder(context),
          child: Stack(
            children: [
              if (order.session.workshop.image.isNotEmpty)
                SizedBox(
                  width: .infinity,
                  child: Image.network(
                    fit: .cover,
                    order.session.workshop.image,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(child: Icon(Icons.broken_image));
                    },
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              Container(
                decoration: order.session.workshop.image.isEmpty
                    ? null
                    : BoxDecoration(
                        gradient: LinearGradient(
                          stops: [0.3, 1],
                          colors: [
                            Theme.of(
                              context,
                            ).colorScheme.secondary.withAlpha(220),
                            Colors.transparent,
                          ],
                        ),
                      ),
                width: .infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: .start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: .start,
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  "${textFields["orderInsription"]}${order.id}",
                                  softWrap: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color:
                                            order.session.workshop.image.isEmpty
                                            ? Theme.of(context).primaryColor
                                            : Colors.white,
                                        fontWeight: .bold,
                                      ),
                                  overflow: .clip,
                                ),
                                Text(
                                  "${textFields["titleInscription"]} ${order.session.workshop.title}",
                                  softWrap: true,
                                  textAlign: .justify,
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(
                                        color:
                                            order.session.workshop.image.isEmpty
                                            ? Theme.of(context).primaryColor
                                            : Colors.white,
                                      ),
                                  overflow: .clip,
                                ),
                              ],
                            ),
                          ),
                          TileCard(
                            child: Text(
                              "${formater.formatDate(order.session.date)} ${formater.formatTime(order.session.date)}",
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: .max,
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TileCard(
                                  child: Text(
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color:
                                              order.payment.status ==
                                                  PaymentStatus.paid
                                              ? Colors.black
                                              : Theme.of(
                                                  context,
                                                ).colorScheme.error,
                                        ),

                                    "${textFields["status"]} ${order.payment.status == PaymentStatus.unpaid ? textFields["unpaid"] : textFields["paid"]}",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                TileCard(
                                  child: Text(
                                    textAlign: .center,
                                    "${textFields["price"]} ${order.session.workshop.fee.toStringAsFixed(2)} ${textFields["currency"]}",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
