import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  Cart({required var items}) {
    items = items;
  }
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  var items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        child: Text(items.length.toString()),
      ),
    );
  }
}

