import 'package:art_studio_app/models/schedule.dart';
import 'package:art_studio_app/objects/workshop_api_repository.dart';
import 'package:art_studio_app/providers/date_formater_provider.dart';
import 'package:art_studio_app/providers/workshop_api_repository_provider.dart';
import 'package:art_studio_app/screens/general.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionCard extends ConsumerStatefulWidget {
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
  ConsumerState<SessionCard> createState() => _SessionCardState();
}

class _SessionCardState extends ConsumerState<SessionCard> {
  late final IWorkshopRepository _repo;
  bool _isLoading = false;

  void _initRepo() async {
    _repo = await ref.read(workshopRepositoryProvider.future);
  }

  @override
  void initState() {
    super.initState();
    _initRepo();
  }

  void _makeAnOrder(BuildContext alertContext) async {
    setState(() {
      _isLoading = true;
    });
    final result = await _repo.orderSession(widget.session.id);
    if (result && mounted && alertContext.mounted) {
      Navigator.of(alertContext).pop();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => GeneralScreen(initialPageIndex: 1)),
        (Route<dynamic> route) => false,
      );
    } else {
      if (alertContext.mounted) Navigator.of(alertContext).pop();
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  onPressed: _isLoading
                      ? () {}
                      : () {
                          _makeAnOrder(ctx);
                        },
                  child: _isLoading
                      ? CircularProgressIndicator()
                      : Text(SessionCard.textFields['book']!),
                ),
                TextButton(
                  onPressed: _isLoading
                      ? () {}
                      : () {
                          Navigator.of(ctx).pop();
                        },
                  child: Text(SessionCard.textFields["cancel"]!),
                ),
              ],
              title: Text(SessionCard.textFields["bookQuestion"]!),
              content: SizedBox(
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  mainAxisSize: .min,
                  children: [
                    Text(
                      "${SessionCard.textFields["timeOfSession"]!}${formater.formatTime(widget.session.date)}",
                    ),
                    Text(
                      "${SessionCard.textFields["place"]!}${widget.session.location}",
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(formater.formatTime(widget.session.date)),
        ),
      ),
    );
  }
}
