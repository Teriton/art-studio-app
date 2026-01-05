import 'package:art_studio_app/widgets/sign_up_form_decorator.dart';
import 'package:flutter/material.dart';

class NameEnter extends StatefulWidget {
  const NameEnter({
    super.key,
    required this.onNextButtonClick,
    required this.onBackButtonClick,
  });

  final void Function() onBackButtonClick;

  final void Function() onNextButtonClick;

  static const textFields = {
    "next": "Далее",
    "changeToLogin": "Уже есть аккаунт? Войти",
    "name": "Имя",
    "errorName": "Поле имя должно быть заполнено",
    "lastname": "Фамилия",
    "errorLastname": "Поле фамилия должно быть заполнено",
    "login": "Логин (минимум 3 символа)",
    "erorrLogin": "Логин должен быть не менее 3 символов",
  };

  @override
  State<NameEnter> createState() => _NameEnterState();
}

class _NameEnterState extends State<NameEnter> {
  final _formKey = GlobalKey<FormState>();
  String? _enteredName;
  String? _enteredLastName;
  String? _enteredLogin;

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_enteredName);
      print(_enteredLastName);
      print(_enteredLogin);
      widget.onNextButtonClick();
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
              "Введите ваши данные",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                label: Text(NameEnter.textFields["name"]!),
              ),
              enableSuggestions: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return NameEnter.textFields["errorName"];
                }
                return null;
              },
              onSaved: (value) {
                _enteredName = value!;
              },
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                label: Text(NameEnter.textFields["lastname"]!),
              ),
              enableSuggestions: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return NameEnter.textFields["errorLastname"];
                }
                return null;
              },
              onSaved: (value) {
                _enteredLastName = value!;
              },
            ),
            TextFormField(
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                label: Text(NameEnter.textFields["login"]!),
              ),
              maxLength: 50,
              enableSuggestions: false,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length < 3 ||
                    value.trim().length > 50) {
                  return NameEnter.textFields["erorrLogin"];
                }
                return null;
              },
              onSaved: (value) {
                _enteredLogin = value!;
              },
            ),
            const SizedBox(height: 16.0),

            ElevatedButton(
              onPressed: _saveItem,
              child: Text(NameEnter.textFields["next"]!),
            ),
            TextButton(
              onPressed: widget.onBackButtonClick,
              child: Text(NameEnter.textFields["changeToLogin"]!),
            ),
          ],
        ),
      ),
    );
  }
}
