import 'package:art_studio_app/mocks/workshop_repository_moc.dart';
import 'package:art_studio_app/models/set_of_materials.dart';
import 'package:art_studio_app/widgets/detailed/set_of_material_card.dart';
import 'package:art_studio_app/widgets/detailed/sets_of_material_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

Future<List<SetOfMaterial>> getSetsOfMaterials() async {
  final repo = WorkshopRepositoryMock();
  final workshopAllRel = await repo.getWorkshopAllRelById(1);
  return workshopAllRel!.setsOfMaterial;
}

void main() {
  group("Sets of materials test", () {
    testWidgets("Widget apears", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: SetsOfMaterialSection(
                setsOfMaterials: await getSetsOfMaterials(),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(SetsOfMaterialSection), findsOneWidget);
    });
    testWidgets("Materials apear", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: SetsOfMaterialSection(
                setsOfMaterials: await getSetsOfMaterials(),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(SetOfMaterialCard), findsWidgets);
    });
  });
}
