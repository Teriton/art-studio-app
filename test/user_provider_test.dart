import 'package:art_studio_app/providers/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'general_screen/profile_test.dart';

void main() {
  group("User provider test", () {
    test("Get user", () async {
      final container = ProviderContainer();
      final user = await container.read(userProvider.future);
      expect(user.id != 0, true);
    });

    test("Refresh orders", () async {
      final container = ProviderContainer();
      container.read(userProvider.notifier).refresh();
    });

    test("Update user", () async {
      final container = ProviderContainer();
      container.read(userProvider.notifier).updateInfo(getUser());
    });
  });
}
