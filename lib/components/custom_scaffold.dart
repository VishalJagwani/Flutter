import 'package:flutter/material.dart';

class CustomScafflod extends StatelessWidget {
  const CustomScafflod({
    required this.customBody,
    this.floatButton,
    this.bottomNavBar,
  });
  final Widget? floatButton;
  final Widget? bottomNavBar;
  final Widget customBody;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavBar,
      floatingActionButton: floatButton,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text(
            'Shiv Bhojanaalay',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 30.0,
            ),
          ),
        ),
      ),
      body: customBody,
    );
  }
}
