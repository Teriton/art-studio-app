import 'package:art_studio_app/widgets/tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Tile card test", () {
    testWidgets("Apears", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: TileCard(child: Text("data"))),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(TileCard), findsOneWidget);
    });
    testWidgets("Child apears", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: TileCard(child: Text("data"))),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(Text), findsOneWidget);
    });
  });
}
