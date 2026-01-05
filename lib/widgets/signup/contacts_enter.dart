import 'package:art_studio_app/widgets/sign_up_form_decorator.dart';
import 'package:flutter/material.dart';

class ContactsEnter extends StatefulWidget {
  const ContactsEnter({
    super.key,
    required this.onNextButtonClick,
    required this.onBackButtonClick,
  });

  final void Function() onNextButtonClick;
  final void Function() onBackButtonClick;
  static const textFields = {
    "next": "Далее",
    "phone": "Номер телефона",
    "errorPhone": "Номер должно иметь фомру +1234567890",
    "email": "Email",
    "errorEmail": "Корректный формат zxc@gmail.com",
  };
  @override
  State<ContactsEnter> createState() => _ContactsEnterState();
}

class _ContactsEnterState extends State<ContactsEnter> {
  final _formKey = GlobalKey<FormState>();
  String? _enteredPhone;
  String? _enteredEmail;

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_enteredPhone);
      print(_enteredEmail);
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
              "Введите ваши контактные данные",
              textAlign: .center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                label: Text(ContactsEnter.textFields["phone"]!),
              ),
              keyboardType: TextInputType.phone,
              enableSuggestions: false,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !RegExp(r'^\+\d{10,15}$').hasMatch(value)) {
                  return ContactsEnter.textFields["errorPhone"];
                }
                return null;
              },
              onSaved: (newValue) {
                _enteredPhone = newValue;
              },
            ),
            TextFormField(
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                label: Text(ContactsEnter.textFields["email"]!),
              ),
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: false,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,7}$',
                    ).hasMatch(value)) {
                  return ContactsEnter.textFields["errorEmail"];
                }
                return null;
              },
              onSaved: (newValue) {
                _enteredEmail = newValue;
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
                  child: Text(ContactsEnter.textFields["next"]!),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
