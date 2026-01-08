import 'package:art_studio_app/models/master.dart';
import 'package:art_studio_app/models/status.dart';
import 'package:art_studio_app/models/technique.dart';
import 'package:art_studio_app/models/workshop.dart';
import 'package:art_studio_app/objects/workshop_api_repository.dart';

class WorkshopRepositoryMock implements IWorkshopRepository {
  @override
  Future<WorkshopMaster?> getClosestWorkshop() {
    return Future(
      () => WorkshopMaster(
        master: Master(
          id: 1,
          firstName: "Log",
          lastName: "Serega",
          specialization: "Pivo",
          experience: 12,
          bio: "Loh kakoyto",
          image: "Pivo",
        ),
        id: 1,
        masterId: 1,
        techniqueId: 12,
        title: "Sosal???",
        difficulty: "Sosalno",
        duration: 12,
        fee: 12.22,
        status: Status.active,
        description: "Sloshno strashno virubay",
        image: "Delfin",
      ),
    );
  }

  @override
  Future<List<WorkshopRel>?> getWorkshops() {
    return Future(
      () => [
        WorkshopRel(
          master: Master(
            id: 1,
            firstName: "Log",
            lastName: "Serega",
            specialization: "Pivo",
            experience: 12,
            bio: "Loh kakoyto",
            image: "Pivo",
          ),
          technique: Technique(id: 12, name: "Solenoe", description: "Opasno"),
          id: 1,
          masterId: 1,
          techniqueId: 12,
          title: "Sosal???",
          difficulty: "Sosalno",
          duration: 12,
          fee: 12.22,
          status: Status.active,
          description: "Sloshno strashno virubay",
          image: "Delfin",
        ),
        WorkshopRel(
          master: Master(
            id: 2,
            firstName: "SHpaaCK",
            lastName: "Vitya",
            specialization: "Pivo",
            experience: 12,
            bio: "Loh kakoyto",
            image: "Pivo",
          ),
          technique: Technique(id: 12, name: "Solenoe", description: "Opasno"),
          id: 2,
          masterId: 2,
          techniqueId: 12,
          title: "Sosal??",
          difficulty: "Pivo",
          duration: 12,
          fee: 12.22,
          status: Status.active,
          description: "Sloshno strashno virubay",
          image: "Delfin",
        ),
      ],
    );
  }

  @override
  Future<bool> hasAccessToken() {
    return Future(() => false);
  }

  @override
  Future<bool> login({required String username, required String password}) {
    if (username == "tester" && password == "test") {
      return Future(() => true);
    }
    return Future(() => false);
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
