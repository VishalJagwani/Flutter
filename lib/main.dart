import 'package:a1_hotel/screens/please_add_items.dart';
import 'package:a1_hotel/screens/order_confirmation.dart';
import 'package:a1_hotel/screens/order_summary_screen.dart';
import 'package:a1_hotel/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:a1_hotel/screens/menu_screen.dart';

void main() {
  runApp(const Hotel());
}

class Hotel extends StatelessWidget {
  const Hotel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        ),
      ),
      home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        MenuScreen.id: (context) => MenuScreen(),
        OrderSummaryScreen.id: (context) => OrderSummaryScreen(
              cartItems: [],
            ),
        OrderConfirmationScreen.id: (context) => OrderConfirmationScreen(),
        PleaseAddItems.id: (context) => PleaseAddItems(),
      },
    );
  }
}
