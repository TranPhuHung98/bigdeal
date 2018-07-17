import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Center(child: Text('Đây là HOME'));
  // }

}

class HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Đây là HOME'));
  }

}