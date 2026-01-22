import 'package:art_studio_app/main.dart';
import 'package:art_studio_app/screens/welcome.dart';
import 'package:art_studio_app/widgets/payment/cash_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../general_screen/orders_list_test.dart';

void main() {
  group("Cash info test", () {
    testWidgets("Info apears", (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: CashInfo(order: getOrders()[0], context: null),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(CashInfo), findsOneWidget);
      expect(find.text(CashInfo.textFields["info"]!), findsOne);
    });
  });
}
