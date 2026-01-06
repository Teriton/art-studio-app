import 'package:art_studio_app/models/master.dart';
import 'package:art_studio_app/models/status.dart';
import 'package:art_studio_app/models/workshop.dart';
import 'package:art_studio_app/objectss/workshop_api_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Repository tests", () {
    test("Get workshops", () async {
      final repository = WorkshopAPIRepository(url: "http://127.0.0.1/api");
      WorkshopMaster? workshop = await repository.getClosestWorkshop();
      expect(workshop!.id > 0, true);
    });
  });
}
