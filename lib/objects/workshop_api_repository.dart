import 'dart:developer';
import 'package:art_studio_app/models/user.dart';
import 'package:art_studio_app/models/workshop.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

abstract class IWorkshopRepository {
  Future<WorkshopMaster?> getClosestWorkshop();
  Future<bool> login({required String username, required String password});
  Future<List<WorkshopRel>?> getWorkshops();
  Future<bool> hasAccessToken();
  Future<bool> logout();
  Future<bool> signUp(UserAdd user);
  Future<bool> isLoginAvailable(String login);
}

class WorkshopAPIRepository implements IWorkshopRepository {
  WorkshopAPIRepository({required this.baseUrl})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
      );

  final String baseUrl;
  final Dio _dio;
  CookieJar? _cookieJar;

  Future<void> init() async {
    final appDir = await getApplicationDocumentsDirectory();
    final cookieDir = '${appDir.path}/.cookies/';
    _cookieJar = PersistCookieJar(storage: FileStorage(cookieDir));
    _dio.interceptors.add(CookieManager(_cookieJar!));
  }

  @override
  Future<bool> hasAccessToken() async {
    final cookies = await _cookieJar!.loadForRequest(Uri.parse(baseUrl));
    return cookies.any((cookie) => cookie.name == 'access_token');
  }

  @override
  Future<bool> login({
    required String username,
    required String password,
  }) async {
    Response response;
    final formData = FormData.fromMap({
      'grant_type': "password",
      'username': username,
      'password': password,
    });
    try {
      response = await _dio.post('/token', data: formData);
    } catch (e) {
      log(e.toString());
      return Future(() => false);
    }
    return Future(() => response.statusCode! < 400);
  }

  @override
  Future<bool> logout() {
    return Future(() async {
      await _cookieJar!.deleteAll();
      return true;
    });
  }

  @override
  Future<WorkshopMaster?> getClosestWorkshop() async {
    Response response;
    try {
      response = await _dio.get("/workshopClosest");
    } catch (e) {
      log(e.toString());
      return null;
    }
    WorkshopMaster workshop = WorkshopMaster.fromJson(response.data);
    return workshop;
  }

  @override
  Future<List<WorkshopRel>?> getWorkshops() async {
    Response response;

    try {
      response = await _dio.get("/workshops");
    } catch (e) {
      log(e.toString());
      return null;
    }

    List<WorkshopRel> workshops = (response.data as List)
        .map((item) => WorkshopRel.fromJson(item as Map<String, dynamic>))
        .toList();

    return workshops;
  }

  @override
  Future<bool> signUp(UserAdd user) async {
    Response response;
    try {
      response = await _dio.post("/signup", data: user.toJson());
    } catch (e) {
      log(e.toString(), level: 900);
      return false;
    }

    return response.statusCode! < 400;
  }

  @override
  Future<bool> isLoginAvailable(String login) async {
    Response response;
    try {
      response = await _dio.post("/isLoginAvailable?login=$login");
    } catch (e) {
      log(e.toString(), level: 900);
      return false;
    }

    if (!response.data["answer"]) {
      return false;
    }

    return response.data["answer"];
  }
}
