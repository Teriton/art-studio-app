import 'package:art_studio_app/config/config.dart';
import 'package:art_studio_app/mocks/workshop_repository_moc.dart';
import 'package:art_studio_app/objects/workshop_api_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workshopRepositoryProvider =
    FutureProvider.autoDispose<IWorkshopRepository>((ref) async {
      if (AppConfig.isDevelopment || AppConfig.isProduction) {
        final repo = WorkshopAPIRepository(baseUrl: "http://192.168.3.18/api/");
        await repo.init();
        return repo;
      }
      final repo = WorkshopRepositoryMock();
      return repo;
    });
