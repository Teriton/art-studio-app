import 'package:art_studio_app/mocks/workshop_repository_moc.dart';
import 'package:art_studio_app/models/user.dart';
import 'package:art_studio_app/models/workshop.dart';
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

    test("Login", () async {
      final repository = WorkshopRepositoryMock();
      final result = await repository.login(
        username: "tester",
        password: "test",
      );
      expect(result, true);
      expect(await repository.hasAccessToken(), true);
    });

    test("Logout", () async {
      final repository = WorkshopRepositoryMock();
      final result = await repository.login(
        username: "tester",
        password: "test",
      );
      expect(result, true);
      expect(await repository.logout(), true);
      expect(await repository.hasAccessToken(), false);
    });

    test("SignUp", () async {
      final repository = WorkshopRepositoryMock();
      final result = await repository.signUp(
        UserAdd(
          firstName: "Shenya",
          lastName: "Shpack",
          email: "sosal@net.hui",
          phoneNumber: "+375253456789",
          login: "chebupel",
          psw: "1234",
          admin: false,
        ),
      );
      expect(result, true);
      expect(
        await repository.login(username: "chebupel", password: "1234"),
        true,
      );
    });

    test("Available login", () async {
      final repository = WorkshopRepositoryMock();
      final testerLogin = await repository.isLoginAvailable("tester");
      expect(testerLogin, false);
      final testerLogin2 = await repository.isLoginAvailable("tester2");
      expect(testerLogin2, true);
    });
  });
}
