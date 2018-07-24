import 'package:big_deal/app.dart';
import 'package:flutter/material.dart';
import 'package:big_deal/app_bloc.dart';

void main() {
  AppBloc appBloc = AppBloc();
  runApp(App(appBloc: appBloc));
  // runApp(MaterialApp(
  //   home: MainFetchData(),
  // ));
}



