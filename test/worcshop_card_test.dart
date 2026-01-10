import 'package:art_studio_app/models/master.dart';
import 'package:art_studio_app/models/status.dart';
import 'package:art_studio_app/models/technique.dart';
import 'package:art_studio_app/models/workshop.dart';
import 'package:art_studio_app/widgets/workshop_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

WorkshopRel getWorkshop() {
  return WorkshopRel(
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
    fee: 76,
    status: Status.active,
    description: "Sloshno strashno virubay",
    image:
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fespanarusa.com%2Ffiles%2Fautoupload%2F26%2F16%2F1%2Fwehfhxac467270.jpg&f=1&nofb=1&ipt=865ab60a83aa6189bdd8d5f661262d405438a4fbaaca0e874edfe3579dc16e49",
  );
}

void main() {
  group("Workshop card", () {
    testWidgets("Title", (tester) async {
      final workshop = getWorkshop();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: WorkshopCard(workshop: workshop)),
        ),
      );
      expect(find.text(workshop.title), findsOne);
    });
    testWidgets("Time and fee", (tester) async {
      final workshop = getWorkshop();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(child: WorkshopCard(workshop: workshop)),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.textContaining(workshop.duration.toString()), findsOne);
      expect(find.textContaining(workshop.fee.toStringAsFixed(2)), findsOne);
    });
  });
}
