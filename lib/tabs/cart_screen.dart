import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CartScreenState();
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Center(child: Text('Đây là HOME'));
  // }

}

class CartScreenState extends State<CartScreen>{
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Đây là Cart'));
  }

}