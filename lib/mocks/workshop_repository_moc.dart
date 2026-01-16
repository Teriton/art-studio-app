import 'package:art_studio_app/models/master.dart';
import 'package:art_studio_app/models/material.dart';
import 'package:art_studio_app/models/orders.dart';
import 'package:art_studio_app/models/payment_method.dart';
import 'package:art_studio_app/models/payment_status.dart';
import 'package:art_studio_app/models/payments.dart';
import 'package:art_studio_app/models/schedule.dart';
import 'package:art_studio_app/models/set_of_materials.dart';
import 'package:art_studio_app/models/status.dart';
import 'package:art_studio_app/models/technique.dart';
import 'package:art_studio_app/models/user.dart';
import 'package:art_studio_app/models/workshop.dart';
import 'package:art_studio_app/objects/workshop_api_repository.dart';

class WorkshopRepositoryMock implements IWorkshopRepository {
  bool _isLogedIn = false;
  List<User> users = [
    User(
      id: 1,
      firstName: "Test",
      lastName: "Test",
      email: "Test",
      phoneNumber: "Test",
      login: "tester",
      psw: "test",
      admin: false,
    ),
  ];

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
    return Future(() => _isLogedIn);
  }

  @override
  Future<bool> login({required String username, required String password}) {
    if (users
        .where((user) => user.login == username && user.psw == password)
        .isNotEmpty) {
      _isLogedIn = true;
      return Future(() => true);
    }
    return Future(() => false);
  }

  @override
  Future<bool> logout() {
    _isLogedIn = false;
    return Future(() => true);
  }

  @override
  Future<bool> signUp(UserAdd user) {
    users.add(
      User(
        id: DateTime.now().second,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        phoneNumber: user.phoneNumber,
        login: user.login,
        psw: user.psw,
        admin: false,
      ),
    );
    return Future(() => true);
  }

  @override
  Future<bool> isLoginAvailable(String login) {
    if (users.where((user) => user.login == login).isNotEmpty) {
      return Future(() => false);
    }
    return Future(() => true);
  }

  @override
  Future<WorkshopAllRel?> getWorkshopAllRelById(int id) async {
    return WorkshopAllRel(
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
      setsOfMaterial: [
        SetOfMaterial(
          material: Material(
            id: 1,
            name: "Тапор",
            description: "Острое опасное оружине",
            cost: 69.99,
            type: "лезвие",
            unit: "шт.",
          ),
          workshopId: 1,
          materialId: 1,
          quantity: 20,
        ),
        SetOfMaterial(
          material: Material(
            id: 2,
            name: "Кирка",
            description: "Острое опасное бревно",
            cost: 68.99,
            type: "лезвие",
            unit: "unit.",
          ),
          workshopId: 1,
          materialId: 3,
          quantity: 7,
        ),
        SetOfMaterial(
          material: Material(
            id: 3,
            name: "Pivo",
            description: "Острое опасное оружине",
            cost: 69.99,
            type: "лезвие",
            unit: "шт.",
          ),
          workshopId: 1,
          materialId: 3,
          quantity: 20,
        ),
        SetOfMaterial(
          material: Material(
            id: 4,
            name: "Kobalt",
            description: "Острое опасное оружине",
            cost: 69.99,
            type: "лезвие",
            unit: "шт.",
          ),
          workshopId: 1,
          materialId: 4,
          quantity: 20,
        ),
      ],
      sessions: [
        Schedule(
          id: 1,
          workshopId: 1,
          date: DateTime.now(),
          location: "Узбекистан",
          numberOfSeats: 10,
        ),
        Schedule(
          id: 2,
          workshopId: 1,
          date: DateTime.now().add(Duration(hours: 2)),
          location: "Узбекистан",
          numberOfSeats: 10,
        ),
        Schedule(
          id: 1,
          workshopId: 1,
          date: DateTime.now().add(Duration(days: 1)),
          location: "Узбекистан",
          numberOfSeats: 10,
        ),
        Schedule(
          id: 2,
          workshopId: 1,
          date: DateTime.now().add(Duration(hours: 2, days: 1)),
          location: "Узбекистан",
          numberOfSeats: 10,
        ),
      ],
    );
  }

  @override
  Future<List<OrderRels>?> getOrders() {
    return Future(
      () => [
        OrderRels(
          payment: Payment(
            id: 1,
            userId: 1,
            orderId: 1,
            status: PaymentStatus.unpaid,
            fee: 12.00,
            paymentMethod: PaymentMethod.card,
          ),
          session: ScheduleWorkshop(
            id: 1,
            workshopId: 1,
            date: DateTime.now(),
            location: "Лондон",
            numberOfSeats: 100,
            workshop: Workshop(
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
          ),
          id: 2,
          userId: 1,
          scheduleId: 1,
          date: DateTime.now(),
          status: Status.active,
        ),
        OrderRels(
          payment: Payment(
            id: 1,
            userId: 1,
            orderId: 1,
            status: PaymentStatus.unpaid,
            fee: 12.00,
            paymentMethod: PaymentMethod.card,
          ),
          session: ScheduleWorkshop(
            id: 2,
            workshopId: 2,
            date: DateTime.now(),
            location: "Piter",
            numberOfSeats: 12,
            workshop: Workshop(
              id: 32,
              masterId: 93,
              techniqueId: 993,
              title: "Sosal???",
              difficulty: "Sosalno",
              duration: 12,
              fee: 12.22,
              status: Status.active,
              description: "Sloshno strashno virubay",
              image: "Delfin",
            ),
          ),
          id: 1,
          userId: 1,
          scheduleId: 1,
          date: DateTime.now(),
          status: Status.active,
        ),
      ],
    );
  }

  @override
  Future<bool> orderSession(int id) {
    return Future(() => true);
  }

  @override
  Future<bool> cancelOrder(int id) {
    return Future(() => true);
  }
}
