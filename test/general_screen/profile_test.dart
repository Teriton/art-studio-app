import 'package:art_studio_app/models/user.dart';
import 'package:art_studio_app/screens/general.dart';
import 'package:art_studio_app/widgets/general/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

User getUser() {
  return User(
    id: 1,
    firstName: "Vitaly",
    lastName: "Shpack",
    email: "sosal@da.hui",
    phoneNumber: "+1234",
    login: "pidr",
    psw: "123456",
    admin: false,
  );
}

void main() {
  group("Profile test", () {
    testWidgets("Profile is apeared", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: ProfilePage(user: getUser())),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(ProfilePage), findsOneWidget);
    });
    testWidgets("User name", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: ProfilePage(user: getUser())),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining(getUser().firstName), findsOne);
      expect(find.textContaining(getUser().lastName), findsOne);
      expect(find.textContaining(getUser().email), findsOne);
      expect(find.textContaining(getUser().phoneNumber), findsOne);
      expect(find.textContaining(getUser().login), findsOne);
    });
    testWidgets("Editable", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: ProfilePage(user: getUser())),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final editButton = find.widgetWithText(
        ElevatedButton,
        ProfilePage.textFields["edit"]!,
      );
      expect(editButton, findsOneWidget);

      await tester.tap(editButton);
      await tester.pump();

      expect(find.byType(TextFormField), findsWidgets);

      final cancelButton = find.widgetWithText(
        TextButton,
        ProfilePage.textFields["cancel"]!,
      );
      expect(cancelButton, findsOneWidget);

      await tester.tap(cancelButton);
      await tester.pump();
      expect(find.byType(TextFormField), findsNothing);
    });
    testWidgets("Save", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(home: GeneralScreen(initialPageIndex: 2)),
        ),
      );
      await tester.pumpAndSettle();

      final editButton = find.widgetWithText(
        ElevatedButton,
        ProfilePage.textFields["edit"]!,
      );
      expect(editButton, findsOneWidget);

      await tester.tap(editButton);
      await tester.pump();

      expect(find.byType(TextFormField), findsWidgets);

      final saveButton = find.widgetWithText(
        ElevatedButton,
        ProfilePage.textFields["save"]!,
      );
      expect(saveButton, findsOneWidget);

      await tester.tap(saveButton);
      await tester.pumpAndSettle();
      expect(find.byType(TextFormField), findsNothing);
    });
  });
}
