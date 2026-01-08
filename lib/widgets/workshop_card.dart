import 'package:art_studio_app/models/workshop.dart';
import 'package:flutter/material.dart';

class WorkshopCard extends StatelessWidget {
  const WorkshopCard({super.key, required this.workshop});

  final WorkshopRel workshop;

  @override
  Widget build(BuildContext context) {
    return Card(child: Text(workshop.title));
  }
}
