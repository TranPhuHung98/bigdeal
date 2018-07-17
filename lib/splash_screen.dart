import 'dart:async';

import 'package:big_deal/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:big_deal/main.dart';

class SplashScreen extends StatefulWidget{
  @override
  SplashScreenState createState() => new SplashScreenState();

}


class SplashScreenState extends State<SplashScreen>{
  
  startTime() async{
    var _duration = new Duration(seconds: 5);
    return Timer(_duration,navigationPage);
  }

  Future navigationPage() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int count = (sharedPreferences.getInt('count')??0);
    print('aaaaaaaaaaaaaaaaaaaa $count');
    if(sharedPreferences.getInt('count')==0){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>WelcomeScreen()));
    }
    // else  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>MyApp()));
    // else Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>MyApp()), ModalRoute.withName('Splash'));
    else Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>MyApp()));
    print('bbbbbbbbbbbbbbbbbbbb $count');
    await sharedPreferences.setInt('count', count);
  }

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      startTime();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("images/logo_bd.png",height: 200.0,width: 300.0,),
      ),
    );
  }

}