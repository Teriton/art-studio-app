import 'package:art_studio_app/providers/workshop_api_repository_provider.dart';
import 'package:art_studio_app/widgets/sign_up_form_decorator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NameEnter extends ConsumerStatefulWidget {
  const NameEnter({
    super.key,
    required this.onNextButtonClick,
    required this.onBackButtonClick,
  });

  final void Function() onBackButtonClick;

  final void Function({
    required String enteredName,
    required String enteredLastName,
    required String enteredLogin,
  })
  onNextButtonClick;

  static const textFields = {
    "next": "Далее",
    "changeToLogin": "Уже есть аккаунт? Войти",
    "name": "Имя",
    "errorName": "Поле имя должно быть заполнено",
    "lastname": "Фамилия",
    "errorLastname": "Поле фамилия должно быть заполнено",
    "login": "Логин (минимум 3 символа)",
    "erorrLogin": "Логин должен быть не менее 3 символов",
    "loginIsNotAvailableError": "Логин уже занят",
  };

  @override
  ConsumerState<NameEnter> createState() => _NameEnterState();
}

class _NameEnterState extends ConsumerState<NameEnter> {
  final _formKey = GlobalKey<FormState>();
  String? _enteredName;
  String? _enteredLastName;
  String? _enteredLogin;
  bool _isLoading = false;
  String? _error;

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      FocusScope.of(context).unfocus();
      if (!(await _loginIsAvalable(_enteredLogin!))) {
        setState(() {
          _error = NameEnter.textFields['loginIsNotAvailableError'];
        });
        return;
      }
      widget.onNextButtonClick(
        enteredName: _enteredName!,
        enteredLastName: _enteredLastName!,
        enteredLogin: _enteredLogin!,
      );
      setState(() {
        _error = null;
      });
    }
  }

  Future<bool> _loginIsAvalable(String login) async {
    setState(() {
      _isLoading = true;
    });
    final repo = await ref.read(workshopRepositoryProvider.future);
    final result = await repo.isLoginAvailable(login);
    setState(() {
      _isLoading = false;
    });
    return result;
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
            if (_error != null)
              Text(
                _error!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isLoading ? () {} : _saveItem,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : Text(NameEnter.textFields["next"]!),
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
