import 'package:art_studio_app/models/workshop.dart';
import 'package:art_studio_app/widgets/workshop_card.dart';
import 'package:flutter/material.dart';

class WorkshopList extends StatelessWidget {
  const WorkshopList({super.key, required this.workshops});

  final List<WorkshopRel> workshops;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: workshops.length,
      separatorBuilder: (ctx, index) {
        return SizedBox(height: 6);
      },
      itemBuilder: (ctx, index) {
        return WorkshopCard(
          workshop: workshops[index],
          key: ValueKey(workshops[index].id),
        );
      },
    );
  }
}
