import 'dart:async';

import 'package:art_studio_app/models/user.dart';
import 'package:art_studio_app/providers/workshop_api_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = AsyncNotifierProvider.autoDispose<UserNotifier, User>(
  UserNotifier.new,
);

class UserNotifier extends AutoDisposeAsyncNotifier<User> {
  @override
  FutureOr<User> build() async {
    final repo = await ref.read(workshopRepositoryProvider.future);
    final user = await repo.info();
    if (user != null) {
      return user;
    }
    return User(
      id: 0,
      firstName: "error",
      lastName: "",
      email: "",
      phoneNumber: "",
      login: "",
      psw: "",
      admin: false,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final repo = await ref.read(workshopRepositoryProvider.future);
    final user = await repo.info();
    if (user != null) {
      state = AsyncValue.data(user);
      return;
    }
    state = AsyncValue.error(
      "Не удалось получить информацию о пользователе",
      StackTrace.current,
    );
  }
}
