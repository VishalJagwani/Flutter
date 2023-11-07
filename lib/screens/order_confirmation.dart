import 'package:a1_hotel/components/custom_scaffold.dart';
import 'package:a1_hotel/components/rounded_button.dart';
import 'package:a1_hotel/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class OrderConfirmationScreen extends StatelessWidget {
  static const String id = 'order_confirmation_screen';

  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScafflod(
      bottomNavBar: RoundedButton(
        title: 'Back to Home',
        color: Colors.lightBlueAccent,
        onButtonPress: () {
          Navigator.popUntil(
            context,
            ModalRoute.withName(WelcomeScreen.id),
          );
        },
      ),
      customBody: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Thank you!',
              style: TextStyle(fontSize: 50.0),
            ),
            Text('Your order is placed successfully!',
                style: TextStyle(fontSize: 25.0)),
          ],
        ),
      ),
    );
  }
}
