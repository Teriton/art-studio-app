import 'package:art_studio_app/providers/workshop_api_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = FutureProvider.autoDispose<bool>((ref) async {
  final repo = ref.watch(workshopRepositoryProvider);
  return await repo.value!.hasAccessToken();
});
