import 'package:flutter/material.dart';
import 'package:flutter_02/src/app.dart';

void main (){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    routes: {
      '/home':(context) => App(),
      ''
    },
  ));
}