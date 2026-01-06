import 'package:art_studio_app/models/workshop.dart';
import 'package:art_studio_app/objectss/workshop_api_repository.dart';
import 'package:art_studio_app/widgets/workshop_card.dart';
import 'package:flutter/material.dart';

class WorkshopList extends StatefulWidget {
  const WorkshopList({super.key});

  @override
  State<WorkshopList> createState() => _WorkshopListState();
}

class _WorkshopListState extends State<WorkshopList> {
  late IWorkshopRepository repository;

  WorkshopMaster? workshop;

  @override
  void initState() {
    super.initState();
    repository = WorkshopAPIRepository(url: "http://192.168.3.18/api");
    _fethWorkshop();
  }

  void _fethWorkshop() async {
    final newWorkshop = await repository.getClosestWorkshop();
    setState(() {
      workshop = newWorkshop;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = CircularProgressIndicator();
    if (workshop != null) {
      content = WorkshopCard(workshop: workshop!);
    }
    return content;
  }
}
