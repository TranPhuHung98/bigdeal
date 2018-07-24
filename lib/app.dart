import 'dart:async';

import 'package:big_deal/app_bloc.dart';
import 'package:big_deal/app_state.dart';
import 'package:big_deal/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:big_deal/tabs/home_screen.dart' as first;
import 'package:big_deal/tabs/cart_screen.dart' as second;
import 'package:big_deal/tabs/profile_tab/profile_screen.dart' as third;
import 'package:big_deal/tabs/profile_tab/logged_screen.dart' as third;

class App extends StatefulWidget {
  final AppBloc appBloc;
  const App({Key key, this.appBloc}) : super(key: key);

  @override
  _App createState() => new _App();
}

class _App extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashScreen(),
        "/": (_) => MyApp(appBloc: widget.appBloc,
),
      },
    );
  }
}

class MyApp extends StatefulWidget {
  final AppBloc appBloc;
  const MyApp({Key key, this.appBloc}) : super(key: key);

  @override
  MyHomePage createState() => new MyHomePage();
}

class MyHomePage extends State<MyApp> with SingleTickerProviderStateMixin {
  bool isLoggedd = false;
  StreamSubscription<AppState> userSubcription;
  
  

  TabController controller;
  @override
  void initState() {
    super.initState();
    saveLogged(isLoggedd);
    userSubcription = widget.appBloc.appState.listen((s) {
      if (s.isLogged != isLoggedd)
        setState(() {
          isLoggedd = s.isLogged;
          print('ddddd $isLoggedd');
          saveLogged(s.isLogged);
        });
    });
    
    
    controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    userSubcription?.cancel();
    super.dispose();
  }

  Future saveLogged(bool logged) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int number = (preferences.getInt('number')??0);
    if(logged) number=1;
    print('numberrrrrrr $number');
    await preferences.setInt('number', number);
    if(preferences.getInt('number')==1) isLoggedd=true;
    print('ccccccccccccccccccccc: $isLoggedd');
  }
  
  // bool kiemtra(bool ktra){
  //   print('kiemtra $isLoggedd');
  //   return ktra;
  // }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
          color: Colors.green,
          child: Container(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: TabBar(
              controller: controller,
              tabs: <Tab>[
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.shopping_cart)),
                Tab(icon: Icon(Icons.perm_identity))
              ],
            ),
          )),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          first.HomeScreen(),
          second.CartScreen(),
          isLoggedd ? third.LoggedScreen() : third.ProfileScreen(appBloc: widget.appBloc,)
        ],
      ),
    );
  }
}
