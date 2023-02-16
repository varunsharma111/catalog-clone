import 'package:flutter/material.dart';
import 'package:oye_busy/widgets/cart_products.dart';
import 'package:oye_busy/widgets/cart_total.dart';
import 'package:oye_busy/widgets/catalog_products.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        "Your Cart", style: const TextStyle(fontWeight: FontWeight.bold),
      ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40),
              bottomLeft: Radius.circular(40),
            )
        ),

      ),
      body: SafeArea(
      child: Column(
          children: [
            CartProducts(),
            CartTotal(),
          ],
        ),
      ),
    );
  }
}


