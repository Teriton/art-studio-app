import 'dart:convert';
import 'dart:developer';
import 'package:art_studio_app/models/workshop.dart';
import 'package:http/http.dart' as http;

abstract class IWorkshopRepository {
  Future<WorkshopMaster?> getClosestWorkshop();
}

class WorkshopAPIRepository implements IWorkshopRepository {
  WorkshopAPIRepository({required String url}) : baseUrl = Uri.parse(url);

  final Uri baseUrl;
  @override
  Future<WorkshopMaster?> getClosestWorkshop() async {
    http.Response response;
    final requestUri = baseUrl.replace(path: "${baseUrl.path}/workshopClosest");
    try {
      response = await http.get(requestUri);
    } catch (e) {
      log(e.toString());
      return null;
    }
    if (response.body.isEmpty) return null;
    final decoded = json.decode(response.body);
    if (decoded == null) return null;
    print(decoded);

    WorkshopMaster workshop = WorkshopMaster.fromJson(decoded);
    return workshop;
  }
}
