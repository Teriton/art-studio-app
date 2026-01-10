import 'package:art_studio_app/models/workshop.dart';
import 'package:art_studio_app/screens/detailed_workshop.dart';
import 'package:flutter/material.dart';

class WorkshopCard extends StatelessWidget {
  const WorkshopCard({super.key, required this.workshop});

  final WorkshopRel workshop;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      clipBehavior: .hardEdge,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => DetailedWorkshopScreen(workshop: workshop),
            ),
          );
        },
        child: Stack(
          children: [
            if (workshop.image.isNotEmpty)
              Hero(
                tag: workshop.id,
                child: SizedBox(
                  height: 200,
                  width: .infinity,
                  child: Image.network(
                    fit: .cover,
                    workshop.image,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(child: Icon(Icons.broken_image));
                    },
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
            if (workshop.image.isEmpty) SizedBox(height: 80),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: workshop.image.isEmpty
                    ? null
                    : BoxDecoration(color: Colors.black54),
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 10,
                ),
                child: Column(
                  mainAxisSize: .min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        spacing: 6,
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              workshop.title,
                              softWrap: true,
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(
                                    color: workshop.image.isEmpty
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                    fontWeight: .bold,
                                  ),
                              overflow: .clip,
                            ),
                          ),
                          Column(
                            children: [
                              TileCard(
                                width: 100,
                                child: Text(
                                  textAlign: .center,
                                  "${workshop.duration.toString()} мин.",
                                ),
                              ),
                              TileCard(
                                width: 100,
                                child: Text(
                                  textAlign: .center,
                                  "${workshop.fee.toStringAsFixed(2)} руб.",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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

class TileCard extends StatelessWidget {
  const TileCard({super.key, required this.child, this.width});

  final Widget child;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Padding(padding: const EdgeInsets.all(4.0), child: child),
      ),
    );
  }
}
