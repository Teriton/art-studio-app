import 'package:art_studio_app/providers/workshop_api_repository_provider.dart';
import 'package:art_studio_app/screens/sign_up.dart';
import 'package:art_studio_app/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Login extends ConsumerStatefulWidget {
  const Login({
    super.key,
    required this.onBackButtonClick,
    required this.onLoginButtonClick,
  });

  static const textFields = {
    "errorLogin": "Введите логин больше 3 символов",
    "errorPassword": "Пароль должен быть длинее 4 символов",
  };

  final void Function() onBackButtonClick;
  final void Function() onLoginButtonClick;

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _enteredLogin;
  String? _enteredPassword;

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      final prod = await ref.read(workshopRepositoryProvider.future);
      final logedIn = await prod.login(
        username: _enteredLogin!,
        password: _enteredPassword!,
      );
      if (logedIn == false) {
        setState(() {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Неверный логин или пароль")));
          _isLoading = false;
        });
        return;
      }
      widget.onLoginButtonClick();
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
                      if (value == null || value.trim().length < 4) {
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
                        child: _isLoading
                            ? CircularProgressIndicator()
                            : Text("Войти"),
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
                        child: Text(WelcomeScreen.textFields["signUp"]!),
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
