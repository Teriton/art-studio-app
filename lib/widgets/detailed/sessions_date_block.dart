import 'package:art_studio_app/models/schedule.dart';
import 'package:art_studio_app/providers/date_formater_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionsDateBlock extends ConsumerStatefulWidget {
  const SessionsDateBlock({
    super.key,
    required this.titile,
    required this.sessions,
  });

  final String titile;
  final List<Schedule> sessions;

  @override
  ConsumerState<SessionsDateBlock> createState() => _SessionsDateBlockState();
}

class _SessionsDateBlockState extends ConsumerState<SessionsDateBlock> {
  @override
  Widget build(BuildContext context) {
    final formater = ref.read(dateFormaterProvider);
    return Column(
      children: [
        Text(widget.titile),
        Row(
          children: [
            for (var session in widget.sessions)
              Text(formater.formatTime(session.date)),
          ],
        ),
      ],
    );
  }
}
