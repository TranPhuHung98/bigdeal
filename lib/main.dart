import 'package:big_deal/tabs/profile_tab/user.dart';
import 'package:flutter/material.dart';
import 'package:big_deal/tabs/home_screen.dart' as first;
import 'package:big_deal/tabs/cart_screen.dart' as second;
import 'package:big_deal/tabs/profile_tab/profile_screen.dart' as third;
import 'package:big_deal/splash_screen.dart';


void main() {
  runApp(MaterialApp(
    home: TestApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyHomePage createState() => new MyHomePage();
}

class MyHomePage extends State<MyApp> with SingleTickerProviderStateMixin {

  TabController controller;
  @override
    void initState() {
      super.initState();
      controller = TabController(vsync: this,length: 3);
    }
  @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // appBar: AppBar(
      //   title: Text('Home'),
      //   bottom: TabBar(
      //     controller: controller,
      //     tabs: <Tab>[
      //       Tab(icon: Icon(Icons.home)),
      //       Tab(icon: Icon(Icons.shopping_cart)),
      //       Tab(icon: Icon(Icons.perm_identity))
      //     ],
      //   ),
      // ),
      bottomNavigationBar: Material(
        color: Colors.green,
        child: Container(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: TabBar(
            controller: controller,
            tabs: <Tab>[
              Tab(icon: Icon(Icons.home),text: 'HOME',),
              Tab(icon: Icon(Icons.shopping_cart),text: 'CART'),
              Tab(icon: Icon(Icons.perm_identity),text: 'PROFILE')
            ],
          ),
        )
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          first.HomeScreen(),
          second.CartScreen(),
          third.ProfileScreen()
        ],
      ),
    );
  }

}

