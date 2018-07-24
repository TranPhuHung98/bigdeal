import 'dart:async';

import 'package:big_deal/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget{
  @override
  SplashScreenState createState() => new SplashScreenState();

}


class SplashScreenState extends State<SplashScreen>{
  
  startTime() async{
    var _duration = new Duration(seconds: 3);
    return Timer(_duration,navigationPage);
  }

  Future navigationPage() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int count = (sharedPreferences.getInt('count')??0);
    print('aaaaaaaaaaaaaaaaaaaa $count');
    if(sharedPreferences.getInt('count')==0){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>WelcomeScreen()));
      count++;
    }
    // else Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>MyApp()));
    else Navigator.of(context).pushReplacementNamed("/");
    print('bbbbbbbbbbbbbbbbbbbb $count');
    await sharedPreferences.setInt('count', count);
  }

  @override
    void initState() {
      super.initState();
      startTime();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("images/logo_bd.png",height: 300.0,width: 350.0,),
      ),
    );
  }

}