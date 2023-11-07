import 'package:a1_hotel/components/custom_scaffold.dart';
import 'package:a1_hotel/components/rounded_button.dart';
import 'package:a1_hotel/screens/menu_screen.dart';
import 'package:a1_hotel/screens/please_add_items.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcome_screen';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScafflod(
      customBody: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 60.0,
        ),
        child: Column(
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            Text(
              'Please select your choice',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedButton(
                      color: Colors.deepOrange,
                      title: 'Menu',
                      onButtonPress: () {
                        Navigator.pushNamed(context, MenuScreen.id);
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    RoundedButton(
                      color: Colors.deepOrange,
                      title: 'Orders',
                      onButtonPress: () {
                        Navigator.pushNamed(context, PleaseAddItems.id);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
