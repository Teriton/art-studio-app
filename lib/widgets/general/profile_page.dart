import 'package:art_studio_app/models/user.dart';
import 'package:art_studio_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key, required this.user});

  final User user;

  static const textFields = {
    "firstName": "Имя",
    "lastName": "Фамилия",
    "emptyError": "Поле должно быть заполнено",
    "login": " Логин:",
    "email": "Email:",
    "emailError": "Невенрно введен email",
    "phone": "Номер телефона:",
    "errorPhone": "Неправильно набран номер",
    "edit": "Редактироваить",
    "cancel": "Отменить",
    "save": "Сохранить",
    "saveError": "Ошибка при сохранении имени",
  };

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  bool _isEdit = false;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  String _firstName = "";
  String _lastName = "";
  String _email = "";
  String _phone = "";

  @override
  void initState() {
    super.initState();
    _resetInfo();
  }

  void _resetInfo() {
    _firstName = widget.user.firstName;
    _lastName = widget.user.lastName;
    _email = widget.user.email;
    _phone = widget.user.phoneNumber;
  }

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState!.save();
      FocusScope.of(context).unfocus();
      UserAdd updatedUser = UserAdd(
        firstName: _firstName,
        lastName: _lastName,
        email: _email,
        phoneNumber: _phone,
        login: widget.user.login,
        psw: widget.user.psw,
        admin: widget.user.admin,
      );
      final result = await ref
          .read(userProvider.notifier)
          .updateInfo(updatedUser);
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        if (result == false) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(ProfilePage.textFields["saveError"]!)),
          );
          return;
        }
        setState(() {
          _isEdit = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      crossAxisAlignment: .start,
      children: [
        Container(
          decoration: BoxDecoration(),
          child: Row(
            mainAxisSize: .max,
            mainAxisAlignment: .spaceAround,
            children: [
              CircleAvatar(
                radius: 40,
                child: Text(
                  style: Theme.of(context).textTheme.titleLarge,
                  "${widget.user.firstName[0]}${widget.user.lastName[0]}",
                ),
              ),
              Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    style: Theme.of(context).textTheme.titleLarge,
                    "${widget.user.firstName} ${widget.user.lastName}",
                  ),
                  Text(
                    "${ProfilePage.textFields["login"]!} ${widget.user.login}",
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Text(
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontWeight: .w200),
          ProfilePage.textFields["email"]!,
        ),
        Text(style: Theme.of(context).textTheme.bodyLarge, widget.user.email),
        SizedBox(height: 20),
        Text(
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontWeight: .w200),
          ProfilePage.textFields["phone"]!,
        ),
        Text(
          style: Theme.of(context).textTheme.bodyLarge,
          widget.user.phoneNumber,
        ),
        SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _isEdit = true;
              });
            },
            child: Text(ProfilePage.textFields["edit"]!),
          ),
        ),
      ],
    );

    if (_isEdit) {
      content = Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              initialValue: _firstName,
              decoration: InputDecoration(
                label: Text(ProfilePage.textFields["firstName"]!),
              ),
              keyboardType: TextInputType.name,
              enableSuggestions: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ProfilePage.textFields["emptyError"];
                }
                return null;
              },
              onSaved: (newValue) {
                _firstName = newValue!;
              },
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              initialValue: _lastName,
              decoration: InputDecoration(
                label: Text(ProfilePage.textFields["lastName"]!),
              ),
              keyboardType: TextInputType.name,
              enableSuggestions: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ProfilePage.textFields["emptyError"];
                }
                return null;
              },
              onSaved: (newValue) {
                _lastName = newValue!;
              },
            ),

            TextFormField(
              textInputAction: TextInputAction.next,
              initialValue: _phone,
              decoration: InputDecoration(
                label: Text(ProfilePage.textFields["phone"]!),
              ),
              keyboardType: TextInputType.phone,
              enableSuggestions: false,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !RegExp(r'^\+\d{10,15}$').hasMatch(value)) {
                  return ProfilePage.textFields["errorPhone"];
                }
                return null;
              },
              onSaved: (newValue) {
                _phone = newValue!;
              },
            ),
            TextFormField(
              textInputAction: TextInputAction.done,
              initialValue: _email,
              decoration: InputDecoration(
                label: Text(ProfilePage.textFields["email"]!),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,7}$',
                    ).hasMatch(value)) {
                  return ProfilePage.textFields["emailError"];
                }
                return null;
              },
              onSaved: (newValue) {
                _email = newValue!;
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: .spaceAround,
              children: [
                TextButton(
                  onPressed: _isLoading
                      ? () {}
                      : () {
                          _resetInfo();
                          setState(() {
                            _isEdit = false;
                          });
                        },
                  child: Text(ProfilePage.textFields["cancel"]!),
                ),
                ElevatedButton(
                  onPressed: _isLoading
                      ? () {}
                      : () {
                          _saveItem();
                        },
                  child: _isLoading
                      ? CircularProgressIndicator()
                      : Text(ProfilePage.textFields["save"]!),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Padding(padding: .all(8), child: content);
  }
}
