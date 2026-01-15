import 'package:art_studio_app/models/orders.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});

  final OrderSession order;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: order.session.workshop.image.isNotEmpty ? 200 : 80,
      width: .infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
        clipBehavior: .hardEdge,
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
                          ).colorScheme.secondary.withAlpha(210),
                          Colors.transparent,
                        ],
                      ),
                    ),
              width: .infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Заказ №${order.id}",
                      softWrap: true,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: order.session.workshop.image.isEmpty
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                        fontWeight: .bold,
                      ),
                      overflow: .clip,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
