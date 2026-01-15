import 'package:art_studio_app/models/schedule.dart';
import 'package:art_studio_app/providers/date_formater_provider.dart';
import 'package:art_studio_app/screens/general.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionCard extends ConsumerWidget {
  const SessionCard({super.key, required this.session});

  static const textFields = {
    "bookQuestion": "Зарезервировать?",
    "book": "Зарезервировать",
    "timeOfSession": "Время проведения: ",
    "place": "Место проведения: ",
    "cancel": "Отмена",
  };

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
            builder: (ctx) => AlertDialog(
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (ctx) => GeneralScreen(initialPageIndex: 1),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Text(textFields['book']!),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text(textFields["cancel"]!),
                ),
              ],
              title: Text(textFields["bookQuestion"]!),
              content: SizedBox(
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  mainAxisSize: .min,
                  children: [
                    Text(
                      "${textFields["timeOfSession"]!}${formater.formatTime(session.date)}",
                    ),
                    Text("${textFields["place"]!}${session.location}"),
                  ],
                ),
              ),
            ),
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
