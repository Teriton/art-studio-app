import 'package:art_studio_app/widgets/sign_up_form_decorator.dart';
import 'package:flutter/material.dart';

class PasswordEnter extends StatefulWidget {
  const PasswordEnter({
    super.key,
    required this.onSignUpButtonClick,
    required this.onBackButtonClick,
  });

  final void Function() onSignUpButtonClick;
  final void Function() onBackButtonClick;
  static const textFields = {
    "signUp": "Зарегестрироваться",
    "password": "Пароль (минимум 6 символов)",
    "passwordError": "Пароль должен быть как минимум 6 символов",
    "repeatPassword": "Повторите пароль",
    "repeatPasswordError": "Вы ввели не коректный пароль",
  };

  @override
  State<PasswordEnter> createState() => _PasswordEnterState();
}

class _PasswordEnterState extends State<PasswordEnter> {
  final _formKey = GlobalKey<FormState>();
  String? _enteredPassword;
  String? _enteredRepeatPassword;

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_enteredPassword);
      print(_enteredRepeatPassword);
      widget.onSignUpButtonClick();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SignUpFormDecorator(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Введите ваш пароль",
              textAlign: .center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              obscureText: true,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                label: Text(PasswordEnter.textFields["password"]!),
              ),
              keyboardType: TextInputType.phone,
              enableSuggestions: false,
              onChanged: (value) {
                _enteredPassword = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return PasswordEnter.textFields["passwordError"];
                }
                return null;
              },
              onSaved: (newValue) {
                _enteredPassword = newValue;
              },
            ),
            TextFormField(
              obscureText: true,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                label: Text(PasswordEnter.textFields["repeatPassword"]!),
              ),
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: false,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value != _enteredPassword) {
                  return PasswordEnter.textFields["repeatPasswordError"];
                }
                return null;
              },
              onSaved: (newValue) {
                _enteredRepeatPassword = newValue;
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: .end,
              children: [
                TextButton(
                  onPressed: widget.onBackButtonClick,
                  child: Text("Назад"),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _saveItem,
                  child: Text(PasswordEnter.textFields["signUp"]!),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
