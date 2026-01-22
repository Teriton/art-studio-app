import 'package:art_studio_app/models/orders.dart';
import 'package:art_studio_app/widgets/payment/card_info.dart';
import 'package:art_studio_app/widgets/payment/cash_info.dart';
import 'package:art_studio_app/widgets/sign_up_form_decorator.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.order});

  final OrderRels order;

  static const textFields = {
    "choseMethodTitle": "Выберите способ оплаты",
    "cash": "На месте",
    "card": "Картой",
    "confirm": "Подтвердить оплату",
  };

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool _cash = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage('assets/images/bg1.jpg'),
          opacity: 0.8,
          fit: .cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 10,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: .light,
          elevation: 0,
          iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.onPrimary,
                  Colors.transparent,
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: SignUpFormDecorator(
            child: Column(
              mainAxisSize: .min,
              children: [
                Text(
                  PaymentScreen.textFields["choseMethodTitle"]!,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  mainAxisAlignment: .spaceAround,
                  children: [
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.all(
                              Radius.circular(10),
                            ),
                          ),
                          backgroundColor: _cash
                              ? Theme.of(context).colorScheme.tertiaryContainer
                              : Colors.white,
                          textStyle: TextStyle(
                            color: _cash
                                ? Theme.of(
                                    context,
                                  ).colorScheme.onTertiaryContainer
                                : Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _cash = true;
                          });
                        },
                        child: Text(PaymentScreen.textFields["cash"]!),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.all(
                              Radius.circular(10),
                            ),
                          ),
                          backgroundColor: !_cash
                              ? Theme.of(context).colorScheme.tertiaryContainer
                              : Colors.white,
                          textStyle: TextStyle(
                            color: !_cash
                                ? Theme.of(
                                    context,
                                  ).colorScheme.onTertiaryContainer
                                : Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _cash = false;
                          });
                        },
                        child: Text(PaymentScreen.textFields["card"]!),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                if (_cash) CashInfo(order: widget.order, context: context),
                if (!_cash) CardInfo(order: widget.order, context: context),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
