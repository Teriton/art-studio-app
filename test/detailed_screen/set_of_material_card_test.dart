import 'package:art_studio_app/widgets/detailed/set_of_material_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'sets_of_materials_section_test.dart';

void main() {
  group('Set of material card apear', () {
    testWidgets("Materials apear", (tester) async {
      final setsOfMaterial = await getSetsOfMaterials();
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: SetOfMaterialCard(setOfMaterial: setsOfMaterial[0]),
            ),
          ),
        ),
      );

      expect(find.byType(SetOfMaterialCard), findsOneWidget);
    });
    testWidgets("Main  inscriptions", (tester) async {
      final setsOfMaterial = await getSetsOfMaterials();
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: SetOfMaterialCard(setOfMaterial: setsOfMaterial[0]),
            ),
          ),
        ),
      );

      expect(find.textContaining(setsOfMaterial[0].material.name), findsAny);
      expect(find.textContaining(setsOfMaterial[0].material.unit), findsAny);
      expect(
        find.textContaining(setsOfMaterial[0].quantity.toString()),
        findsAny,
      );
    });
  });
}
