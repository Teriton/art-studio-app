import 'package:art_studio_app/mocks/workshop_repository_moc.dart';
import 'package:art_studio_app/models/schedule.dart';
import 'package:art_studio_app/objects/date_formater.dart';
import 'package:art_studio_app/screens/general.dart';
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
      final sessions = await getSessions();
      final formater = DateFormater();
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: SessionsSection(sessions: sessions)),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final sessionsArr = await getSessions();
      final dateButton = find.widgetWithText(
        ExpansionTile,
        formater.formatDate(sessionsArr[0].date),
      );
      expect(dateButton, findsWidgets);
    });
    testWidgets("Alert test", (tester) async {
      final sessions = await getSessions();
      final formater = DateFormater();
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: SessionsSection(sessions: sessions)),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final sessionsArr = await getSessions();
      final dateButton = find.widgetWithText(
        ExpansionTile,
        formater.formatDate(sessionsArr[0].date),
      );
      expect(dateButton, findsWidgets);

      await tester.tap(dateButton);
      await tester.pumpAndSettle();

      final sessionCard = find.widgetWithText(
        Card,
        formater.formatTime(sessionsArr[0].date),
      );
      expect(sessionCard, findsOneWidget);

      await tester.tap(sessionCard);
      await tester.pumpAndSettle();
      expect(find.byType(AlertDialog), findsOneWidget);
      expect(
        find.textContaining(formater.formatTime(sessionsArr[0].date)),
        findsAny,
      );
      expect(find.textContaining(sessionsArr[0].location), findsAny);
    });
    testWidgets("Cancel alert button", (tester) async {
      final sessions = await getSessions();
      final formater = DateFormater();
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: SessionsSection(sessions: sessions)),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final sessionsArr = await getSessions();
      final dateButton = find.widgetWithText(
        ExpansionTile,
        formater.formatDate(sessionsArr[0].date),
      );
      expect(dateButton, findsWidgets);

      await tester.tap(dateButton);
      await tester.pumpAndSettle();

      final sessionCard = find.widgetWithText(
        Card,
        formater.formatTime(sessionsArr[0].date),
      );
      expect(sessionCard, findsOneWidget);

      await tester.tap(sessionCard);
      await tester.pumpAndSettle();
      expect(find.byType(AlertDialog), findsOneWidget);
      final cancelButton = find.byType(TextButton);
      expect(cancelButton, findsOneWidget);
      await tester.tap(cancelButton);
      await tester.pumpAndSettle();
      expect(find.byType(AlertDialog), findsNothing);
    });
    testWidgets("Order alert button", (tester) async {
      final sessions = await getSessions();
      final formater = DateFormater();
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: SessionsSection(sessions: sessions)),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final sessionsArr = await getSessions();
      final dateButton = find.widgetWithText(
        ExpansionTile,
        formater.formatDate(sessionsArr[0].date),
      );
      expect(dateButton, findsWidgets);

      await tester.tap(dateButton);
      await tester.pumpAndSettle();

      final sessionCard = find.widgetWithText(
        Card,
        formater.formatTime(sessionsArr[0].date),
      );
      expect(sessionCard, findsOneWidget);

      await tester.tap(sessionCard);
      await tester.pumpAndSettle();
      expect(find.byType(AlertDialog), findsOneWidget);
      final orderButton = find.byType(ElevatedButton);
      expect(orderButton, findsOneWidget);
      await tester.tap(orderButton);
      await tester.pumpAndSettle();
      expect(find.byType(AlertDialog), findsNothing);
      expect(find.byType(GeneralScreen), findsOneWidget);
    });
  });
}
