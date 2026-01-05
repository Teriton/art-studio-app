import 'package:art_studio_app/screens/sign_up.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.onBackButtonClick});

  static const textFields = {
    "errorLogin": "Введите логин больше 3 символов",
    "errorPassword": "Пароль должен быть длинее 6 символов",
  };

  final void Function() onBackButtonClick;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String? _enteredLogin;
  String? _enteredPassword;

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_enteredLogin);
      print(_enteredPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: [
        Card(
          margin: .symmetric(horizontal: 30),
          color: Theme.of(context).colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: widget.onBackButtonClick,
                        icon: Icon(Icons.arrow_back_rounded),
                      ),
                      Text(
                        "Ввойдите в аккаунт",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    textInputAction: .next,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    maxLength: 50,
                    decoration: const InputDecoration(label: Text("Логин")),
                    enableSuggestions: false,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length <= 3 ||
                          value.trim().length > 50) {
                        return Login.textFields["errorLogin"];
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _enteredLogin = value!;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Пароль"),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.trim().length < 6) {
                        return Login.textFields["errorPassword"];
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _enteredPassword = value!;
                    },
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: _saveItem,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.onPrimary,
                        ),
                        child: Text("Войти"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) {
                                return const SignUpScreen();
                              },
                            ),
                          );
                        },
                        child: Text("У меня нету аккаунта"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
