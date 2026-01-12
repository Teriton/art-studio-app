import 'package:art_studio_app/models/schedule.dart';
import 'package:art_studio_app/providers/date_formater_provider.dart';
import 'package:art_studio_app/providers/sessions_sorter_provider.dart';
import 'package:art_studio_app/widgets/detailed/sessions_date_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionsSection extends ConsumerWidget {
  const SessionsSection({super.key, required this.sessions});

  final List<Schedule> sessions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateFormater = ref.read(dateFormaterProvider);
    final sessionsSorter = ref.read(sessionsSorterProvider);
    final organizedSessions = sessionsSorter.organizeSessions(sessions);
    return Column(
      children: [
        for (var date in organizedSessions.keys)
          SessionsDateBlock(
            titile: dateFormater.formatDate(date),
            sessions: organizedSessions[date]!,
          ),
      ],
    );
  }
}
