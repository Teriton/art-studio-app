import 'package:art_studio_app/widgets/signup/contacts_enter.dart';
import 'package:art_studio_app/widgets/signup/name_enter.dart';
import 'package:art_studio_app/widgets/signup/password_enter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Enter name screen", () {
    testWidgets("Test visual", (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: NameEnter(onNextButtonClick: () {}, onBackButtonClick: () {}),
        ),
      );

      final button = find.widgetWithText(
        ElevatedButton,
        NameEnter.textFields["next"]!,
      );
      expect(button, findsOneWidget);
    });

    testWidgets("Validator test", (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: NameEnter(onNextButtonClick: () {}, onBackButtonClick: () {}),
        ),
      );
      final name = find.widgetWithText(
        TextFormField,
        NameEnter.textFields["name"]!,
      );
      expect(name, findsOneWidget);
      final lastname = find.widgetWithText(
        TextFormField,
        NameEnter.textFields["lastname"]!,
      );
      expect(lastname, findsOneWidget);
      final login = find.widgetWithText(
        TextFormField,
        NameEnter.textFields["login"]!,
      );
      expect(login, findsOneWidget);
      final nextButton = find.widgetWithText(
        ElevatedButton,
        NameEnter.textFields["next"]!,
      );
      expect(nextButton, findsOneWidget);

      await tester.tap(nextButton);
      await tester.pumpAndSettle();
      final nameErrorText = find.text(NameEnter.textFields["errorName"]!);
      expect(nameErrorText, findsOne);
      final lastnameErrorText = find.text(
        NameEnter.textFields["errorLastname"]!,
      );
      expect(lastnameErrorText, findsOne);
      final erorrLoginText = find.text(NameEnter.textFields["erorrLogin"]!);
      expect(erorrLoginText, findsOne);

      await tester.enterText(name, "name");
      await tester.enterText(lastname, "lastname");
      await tester.enterText(login, "login");
      await tester.tap(nextButton);
      await tester.pumpAndSettle();
      expect(nameErrorText, findsNothing);
      expect(lastnameErrorText, findsNothing);
      expect(erorrLoginText, findsNothing);
    });
  });

  group("Enter contacts screen", () {
    testWidgets("Test visual", (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ContactsEnter(
            onNextButtonClick: () {},
            onBackButtonClick: () {},
          ),
        ),
      );

      final button = find.widgetWithText(
        ElevatedButton,
        ContactsEnter.textFields["next"]!,
      );
      expect(button, findsOneWidget);
    });

    testWidgets("Validate test", (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ContactsEnter(
            onNextButtonClick: () {},
            onBackButtonClick: () {},
          ),
        ),
      );
      final phone = find.widgetWithText(
        TextFormField,
        ContactsEnter.textFields["phone"]!,
      );
      expect(phone, findsOneWidget);
      final email = find.widgetWithText(
        TextFormField,
        ContactsEnter.textFields["email"]!,
      );
      expect(email, findsOneWidget);
      final nextButton = find.widgetWithText(
        ElevatedButton,
        ContactsEnter.textFields["next"]!,
      );
      expect(nextButton, findsOneWidget);

      await tester.tap(nextButton);
      await tester.pumpAndSettle();
      final phoneErrorText = find.text(ContactsEnter.textFields["errorPhone"]!);
      expect(phoneErrorText, findsOne);

      final emailErrorText = find.text(ContactsEnter.textFields["errorEmail"]!);
      expect(emailErrorText, findsOne);

      await tester.enterText(phone, "+375291234567");
      await tester.enterText(email, "hello@shpack.monster");
      await tester.tap(nextButton);
      await tester.pumpAndSettle();
      expect(phoneErrorText, findsNothing);
      expect(emailErrorText, findsNothing);
    });
  });

  group("Test password", () {
    testWidgets("Test visual", (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PasswordEnter(
            onSignUpButtonClick: () {},
            onBackButtonClick: () {},
          ),
        ),
      );

      final button = find.widgetWithText(
        ElevatedButton,
        PasswordEnter.textFields["signUp"]!,
      );
      expect(button, findsOneWidget);
    });
    testWidgets("Validate test", (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PasswordEnter(
            onSignUpButtonClick: () {},
            onBackButtonClick: () {},
          ),
        ),
      );
      final password = find.widgetWithText(
        TextFormField,
        PasswordEnter.textFields["password"]!,
      );
      expect(password, findsOneWidget);
      final repeatPassword = find.widgetWithText(
        TextFormField,
        PasswordEnter.textFields["repeatPassword"]!,
      );
      expect(repeatPassword, findsOneWidget);
      final nextButton = find.widgetWithText(
        ElevatedButton,
        PasswordEnter.textFields["signUp"]!,
      );
      expect(nextButton, findsOneWidget);

      await tester.tap(nextButton);
      await tester.pumpAndSettle();
      final phoneErrorText = find.text(
        PasswordEnter.textFields["passwordError"]!,
      );
      expect(phoneErrorText, findsOne);

      final emailErrorText = find.text(
        PasswordEnter.textFields["repeatPasswordError"]!,
      );
      expect(emailErrorText, findsOne);

      await tester.enterText(password, "123456");
      await tester.enterText(repeatPassword, "123456");
      await tester.tap(nextButton);
      await tester.pumpAndSettle();
      expect(phoneErrorText, findsNothing);
      expect(emailErrorText, findsNothing);
    });
  });
}
