import 'package:a1_hotel/components/custom_scaffold.dart';
import 'package:a1_hotel/components/rounded_button.dart';
import 'package:flutter/material.dart';

class PleaseAddItems extends StatelessWidget {
  static const String id = 'please_add_items';
  const PleaseAddItems({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScafflod(
      bottomNavBar: RoundedButton(
        title: 'Go Back',
        color: Colors.red,
        onButtonPress: () {
          Navigator.pop(context);
        },
      ),
      customBody: Center(
        child: Text('Please select items from the Menu'),
      ),
    );
  }
}
