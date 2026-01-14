import 'package:art_studio_app/objects/date_formater.dart';
import 'package:art_studio_app/widgets/detailed/session_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../session_sorter_test.dart';

void main() {
  group("Session card", () {
    testWidgets("Card apears", (tester) async {
      final sessions = getSessions();
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(home: SessionCard(session: sessions[0])),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(SessionCard), findsOneWidget);
    });
    testWidgets("Text test", (tester) async {
      final formater = DateFormater();
      final sessions = getSessions();
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(home: SessionCard(session: sessions[0])),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.textContaining(formater.formatTime(sessions[0].date)),
        findsOne,
      );
    });
  });
}
