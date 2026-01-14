import 'package:art_studio_app/mocks/workshop_repository_moc.dart';
import 'package:art_studio_app/models/schedule.dart';
import 'package:art_studio_app/objects/date_formater.dart';
import 'package:art_studio_app/widgets/detailed/sessions_date_block.dart';
import 'package:art_studio_app/widgets/detailed/sessions_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

Future<List<Schedule>> getSessions() async {
  final repo = WorkshopRepositoryMock();
  final workshopAllRel = await repo.getWorkshopAllRelById(1);
  return workshopAllRel!.sessions;
}

void main() {
  group("Sessions section test", () {
    testWidgets("Test is going right", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: SessionsSection(sessions: await getSessions()),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(SessionsSection), findsOneWidget);
    });
    testWidgets("Session blocks apear", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: SessionsSection(sessions: await getSessions()),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(SessionsDateBlock), findsWidgets);
    });
    testWidgets("Expandes test", (tester) async {
      final sessionsArr = await getSessions();
      final formater = DateFormater();
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: SessionsSection(sessions: sessionsArr)),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final dateButton = find.widgetWithText(
        ExpansionTile,
        formater.formatDate(sessionsArr[0].date),
      );
      expect(dateButton, findsWidgets);
    });
  });
}
