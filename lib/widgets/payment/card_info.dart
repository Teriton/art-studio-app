import 'package:art_studio_app/models/orders.dart';
import 'package:art_studio_app/models/payment_method.dart';
import 'package:art_studio_app/providers/order_provider.dart';
import 'package:art_studio_app/screens/general.dart';
import 'package:art_studio_app/screens/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardInfo extends ConsumerStatefulWidget {
  const CardInfo({super.key, required this.order, required context})
    : parentContext = context;
  final OrderRels order;
  final BuildContext? parentContext;

  static const textFields = {
    "info": "Заполните данные карты",
    "cardNumberField": "Номер карты",
    "cardNumberFieldError": "Поле номер карты должно быть заполнено",
    "expiryField": "Месяц/Год",
    "expiryFieldError": "Поле срока действия должно быть заполнено (MM/YY)",
    "cvcField": "CVC",
    "cvcFieldError": "CVC должен содержать 3-4 цифры",
    "cardholderField": "Имя на карте",
    "cardholderFieldError": "Поле имени должно быть заполнено",
    "errorPayment": "Не удалось произвести оплату",
  };

  @override
  ConsumerState<CardInfo> createState() => _CardInfoState();
}

class _CardInfoState extends ConsumerState<CardInfo> {
  final _formKey = GlobalKey<FormState>();
  String _enteredNumberCard = "";
  String _enteredExpiry = "";
  String _enteredCvc = "";
  String _enteredCardholder = "";
  bool _isLoading = false;

  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvcController = TextEditingController();
  final _cardholderController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvcController.dispose();
    _cardholderController.dispose();
    super.dispose();
  }

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      FocusScope.of(context).unfocus();
      final result = await ref
          .read(orderProvider.notifier)
          .payForOrder(widget.order.id, PaymentMethod.card);
      if (result &&
          widget.parentContext != null &&
          widget.parentContext!.mounted) {
        Navigator.of(widget.parentContext!).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (ctx) => GeneralScreen(initialPageIndex: 1),
          ),
          (Route<dynamic> route) => false,
        );
      } else {
        if (widget.parentContext != null && !widget.parentContext!.mounted) {
          return;
        }
        ScaffoldMessenger.of(widget.parentContext!).clearSnackBars();
        ScaffoldMessenger.of(widget.parentContext!).showSnackBar(
          SnackBar(content: Text(CardInfo.textFields["errorPayment"]!)),
        );
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(CardInfo.textFields["info"]!),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _cardNumberController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(CardInfo.textFields["cardNumberField"]!),
                  hintText: "0000 0000 0000 0000",
                ),
                enableSuggestions: false,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CardNumberFormatter(),
                ],
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.replaceAll(" ", "").length < 16) {
                    return CardInfo.textFields["cardNumberFieldError"];
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredNumberCard = value?.replaceAll(" ", "") ?? "";
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _expiryController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text(CardInfo.textFields["expiryField"]!),
                        hintText: "MM/YY",
                      ),
                      enableSuggestions: false,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        ExpiryDateFormatter(),
                      ],
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 5) {
                          return CardInfo.textFields["expiryFieldError"];
                        }

                        final parts = value.split('/');
                        if (parts.length != 2) {
                          return CardInfo.textFields["expiryFieldError"];
                        }

                        final month = int.tryParse(parts[0]);
                        if (month == null || month < 1 || month > 12) {
                          return "Месяц должен быть от 01 до 12";
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _enteredExpiry = value ?? "";
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: _cvcController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text(CardInfo.textFields["cvcField"]!),
                        hintText: "000",
                      ),
                      enableSuggestions: false,
                      obscureText: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                      ],
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 3) {
                          return CardInfo.textFields["cvcFieldError"];
                        }
                        if (value.length > 4) {
                          return CardInfo.textFields["cvcFieldError"];
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredCvc = value ?? "";
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _cardholderController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  label: Text(CardInfo.textFields["cardholderField"]!),
                ),
                enableSuggestions: false,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-Zа-яА-ЯёЁ\s]'),
                  ),
                ],
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length < 2) {
                    return CardInfo.textFields["cardholderFieldError"];
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredCardholder = value?.toUpperCase() ?? "";
                },
              ),
              OutlinedButton(
                onPressed: () {
                  _saveItem();
                },
                child: _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Text(PaymentScreen.textFields['confirm']!),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    if (text.isEmpty) {
      return newValue;
    }

    final digitsOnly = text.replaceAll(' ', '');

    final limited = digitsOnly.length > 16
        ? digitsOnly.substring(0, 16)
        : digitsOnly;

    final formatted = _formatCardNumber(limited);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  String _formatCardNumber(String digitsOnly) {
    final buffer = StringBuffer();

    for (int i = 0; i < digitsOnly.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(digitsOnly[i]);
    }

    return buffer.toString();
  }
}

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    if (text.isEmpty) {
      return newValue;
    }

    final digitsOnly = text.replaceAll('/', '');

    if (digitsOnly.length > 4) {
      return oldValue;
    }

    final formatted = _formatExpiryDate(digitsOnly);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  String _formatExpiryDate(String digitsOnly) {
    if (digitsOnly.isEmpty) {
      return '';
    }

    if (digitsOnly.length <= 2) {
      return digitsOnly;
    }

    return '${digitsOnly.substring(0, 2)}/${digitsOnly.substring(2)}';
  }
}
