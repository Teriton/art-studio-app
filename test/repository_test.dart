import 'package:art_studio_app/mocks/workshop_repository_moc.dart';
import 'package:art_studio_app/models/workshop.dart';
import 'package:art_studio_app/objects/workshop_api_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Api repository tests", () {
    test("Get workshops", () async {
      final repository = WorkshopRepositoryMock();
      List<WorkshopRel>? workshops = await repository.getWorkshops();
      expect(workshops != null, true);
    });

    test("Getting token", () async {
      final repository = WorkshopRepositoryMock();
      bool logedIn = await repository.login(
        username: "tester",
        password: "test",
      );
      expect(logedIn, true);
    });

    test("Get closestWorkshop", () async {
      final repository = WorkshopRepositoryMock();
      WorkshopMaster? workshop = await repository.getClosestWorkshop();
      expect(workshop!.id > 0, true);
    });
  });
}
