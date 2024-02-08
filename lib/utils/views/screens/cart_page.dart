import 'package:flutter/material.dart';

import '../../product_utils.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: cartItems
                .map(
                  (e) => Container(
                    height: size.height * 0.20,
                    color: Colors.blue,
                    margin: const EdgeInsets.only(bottom: 15),
                    alignment: Alignment.topCenter,
                    child: Text(e['title']),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
