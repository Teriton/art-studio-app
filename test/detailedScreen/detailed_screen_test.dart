import 'package:art_studio_app/screens/detailed_workshop.dart';
import 'package:art_studio_app/widgets/detailed/sessions_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../worcshop_card_test.dart';

void main() {
  group("Detailed screen test", () {
    testWidgets("Test is going right", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: DetailedWorkshopScreen(workshop: getWorkshop()),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(DetailedWorkshopScreen), findsOneWidget);
    });
    testWidgets("Title apears", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: DetailedWorkshopScreen(workshop: getWorkshop()),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text(getWorkshop().title), findsOne);
    });
    testWidgets("Image apears", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: DetailedWorkshopScreen(workshop: getWorkshop()),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.image(NetworkImage(getWorkshop().image)), findsOne);
    });

    testWidgets("Title apear", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: DetailedWorkshopScreen(workshop: getWorkshop()),
          ),
        ),
      );

      expect(find.text(getWorkshop().title), findsOneWidget);
    });
    testWidgets("Description apear", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: DetailedWorkshopScreen(workshop: getWorkshop()),
          ),
        ),
      );
      expect(find.text(getWorkshop().description), findsOneWidget);
    });

    testWidgets("Master apear", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: DetailedWorkshopScreen(workshop: getWorkshop()),
          ),
        ),
      );
      expect(find.textContaining(getWorkshop().master.firstName), findsWidgets);
      expect(find.textContaining(getWorkshop().master.lastName), findsWidgets);
    });

    testWidgets("Fee apears", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: DetailedWorkshopScreen(workshop: getWorkshop()),
          ),
        ),
      );

      expect(find.textContaining(getWorkshop().fee.toString()), findsWidgets);
    });
    testWidgets("Duration apear", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: DetailedWorkshopScreen(workshop: getWorkshop()),
          ),
        ),
      );

      expect(
        find.textContaining(getWorkshop().duration.toString()),
        findsWidgets,
      );
    });
    testWidgets("Technique apear", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: DetailedWorkshopScreen(workshop: getWorkshop()),
          ),
        ),
      );

      expect(find.text(getWorkshop().technique.name), findsWidgets);
    });
    testWidgets("Session section apear", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: DetailedWorkshopScreen(workshop: getWorkshop()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SessionsSection), findsOneWidget);
    });
  });
}
