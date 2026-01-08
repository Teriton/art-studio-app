import 'package:art_studio_app/screens/general.dart';
import 'package:art_studio_app/screens/welcome.dart';
import 'package:art_studio_app/widgets/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Welcome screen", () {
    testWidgets("Next button test", (tester) async {
      await tester.pumpWidget(MaterialApp(home: WelcomeScreen()));

      final button = find.byType(ElevatedButton);
      expect(button, findsOneWidget);
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      final imageFinder = find.byType(TextFormField);

      expect(imageFinder, findsWidgets);
    });

    testWidgets("Back Butoon test", (tester) async {
      await tester.pumpWidget(MaterialApp(home: WelcomeScreen()));
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      final button = find.byType(IconButton);
      expect(button, findsOneWidget);
      await tester.tap(button);
      await tester.pumpAndSettle();
      final welcomeText = find.text("Добро пожаловать");
      expect(welcomeText, findsOne);
    });

    testWidgets("Verification login fields test ", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Login(onBackButtonClick: () {}, onLoginButtonClick: () {}),
            ),
          ),
        ),
      );

      final login = find.widgetWithText(TextFormField, "Логин");
      expect(login, findsOneWidget);
      final password = find.widgetWithText(TextFormField, "Пароль");
      expect(password, findsOneWidget);
      final signinButton = find.widgetWithText(ElevatedButton, "Войти");
      expect(signinButton, findsOneWidget);

      await tester.tap(signinButton);
      await tester.pumpAndSettle();
      final loginErrorText = find.text(Login.textFields["errorLogin"]!);
      expect(loginErrorText, findsOne);
      final passwordErrorText = find.text(Login.textFields["errorPassword"]!);
      expect(passwordErrorText, findsOne);

      await tester.enterText(login, "username");
      await tester.enterText(password, "password");
      await tester.tap(signinButton);
      await tester.pumpAndSettle();
      expect(loginErrorText, findsNothing);
      expect(passwordErrorText, findsNothing);
    });
    testWidgets("Go to general test", (tester) async {
      await tester.pumpWidget(
        ProviderScope(child: MaterialApp(home: WelcomeScreen())),
      );

      final nextButton = find.widgetWithText(ElevatedButton, "Далее");
      expect(nextButton, findsOneWidget);
      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      final login = find.widgetWithText(TextFormField, "Логин");
      expect(login, findsOneWidget);
      final password = find.widgetWithText(TextFormField, "Пароль");
      expect(password, findsOneWidget);
      final signinButton = find.widgetWithText(ElevatedButton, "Войти");
      expect(signinButton, findsOneWidget);

      await tester.enterText(login, "tester");
      await tester.enterText(password, "test");
      await tester.tap(signinButton);
      await tester.pumpAndSettle();

      expect(find.byType(GeneralScreen), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsNothing);
    });
  });
}
