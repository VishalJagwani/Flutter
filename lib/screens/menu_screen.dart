import 'dart:math';

import 'package:a1_hotel/components/custom_scaffold.dart';
import 'package:a1_hotel/components/rounded_button.dart';
import 'package:a1_hotel/constans.dart';
import 'package:a1_hotel/screens/cart_item.dart';
import 'package:a1_hotel/screens/order_summary_screen.dart';
import 'package:a1_hotel/screens/please_add_items.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  static const String id = 'menu_screen';
  bool isEmpty = true;

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<CartItem> cartItems = [];

  Widget getCounter(counter) {
    print('Co $counter');
    if (counter == 1) {
      return Text(
        'x$counter',
        style: TextStyle(
          color: Colors.white,
        ),
      );
    } else {
      return Text('');
    }
  }

  Column makeMenuItems() {
    List<Widget> menuItems = [];
    int counter = 0;
    for (String menuItem in MenuItems) {
      var priceDouble = Random().nextInt(300) + 80;
      String price = priceDouble.toStringAsFixed(2);
      menuItems.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.lightGreen,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5.0,
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    menuItem,
                    style: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Rs. ${price}',
                ),
                RoundedButton(
                  color: Colors.lightBlueAccent,
                  title: 'Add',
                  onButtonPress: () {
                    widget.isEmpty = false;
                    cartItems.add(
                      CartItem(name: menuItem, price: price),
                    );
                  },
                ),
                getCounter(counter),
              ],
            ),
          ],
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: menuItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScafflod(
      floatButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        onPressed: () {
          if (widget.isEmpty == false) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderSummaryScreen(cartItems: cartItems),
              ),
            );
          } else {
            Navigator.pushNamed(context, PleaseAddItems.id);
          }
        },
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
      customBody: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Card(
                  color: Colors.pink,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        // backgroundColor: Colors.blueAccent,
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                ),
              ),
              makeMenuItems(),
            ],
          ),
        ),
      ),
    );
  }
}
