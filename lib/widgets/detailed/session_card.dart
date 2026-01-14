import 'package:art_studio_app/models/schedule.dart';
import 'package:art_studio_app/providers/date_formater_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionCard extends ConsumerWidget {
  const SessionCard({super.key, required this.session});

  static const textFields = {"book": "Зарезервировать?"};

  final Schedule session;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formater = ref.read(dateFormaterProvider);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      clipBehavior: .hardEdge,
      margin: .all(8),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(title: Text(textFields["book"]!)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(formater.formatTime(session.date)),
        ),
      ),
    );
  }
}
