import 'package:a1_hotel/components/rounded_button.dart';
import 'package:a1_hotel/screens/cart_item.dart';
import 'package:a1_hotel/screens/order_confirmation.dart';
import 'package:flutter/material.dart';

import '../components/custom_scaffold.dart';

class OrderSummaryScreen extends StatefulWidget {
  static const String id = 'order_summary_screen';
  List<CartItem> cartItems;

  OrderSummaryScreen({required this.cartItems});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  List<double> totalPrice = [];

  double sumTotalPrice = 0;

  Widget getTotalPrice() {
    for (CartItem item in widget.cartItems) {
      var a = double.parse(item.price);
      sumTotalPrice = sumTotalPrice + a;
      // totalPrice.add(a);
    }
    // print(totalPrice);
    // for (int i in totalPrice) {
    //   sumTotalPrice = (sumTotalPrice! + i)!;
    // }
    return RoundedButton(
      title: 'Place Order',
      color: Colors.green,
      onButtonPress: () {
        sumTotalPrice = 0;
        Navigator.pushNamed(context, OrderConfirmationScreen.id);
      },
    );
  }

  Widget getItems() {
    List<Widget> listOfItems = [];
    CartItem item = widget.cartItems[0];
    print('aswd ${item.name}');
    for (CartItem item in widget.cartItems) {
      listOfItems.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
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
                      item.name,
                      style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Rs. ${item.price}',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: listOfItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScafflod(
      bottomNavBar: getTotalPrice(),
      customBody: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Your selected items are:',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            getItems(),
            Text(
              'Total Amount: ${sumTotalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
