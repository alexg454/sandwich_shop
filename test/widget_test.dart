import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/screens/menu_screen.dart';
import 'package:sandwich_shop/screens/order_screen.dart';

void main() {
  group('OrderItemDisplay widget tests', () {
    testWidgets('Displays zero sandwiches with no emoji', 
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: OrderItemDisplay(0, 'Footlong Sub'),
            ),
          ),
        );

        expect(find.text('0 Footlong Sub sandwich(es): '), findsOneWidget);
    });

    testWidgets('Displays three sandwiches with three emojis', 
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: OrderItemDisplay(3, 'Footlong Sub')
            ),
          ),
        );

        expect(find.text('3 Footlong Sub sandwich(es): 🥪🥪🥪'), findsOneWidget);
      });
  });
}