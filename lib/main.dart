import 'package:flutter/material.dart';
import 'package:flutter_02/src/pages/alert_page.dart';
import 'package:flutter_02/src/routes/routes_pages.dart';

void main (){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    routes: routes,
    // this for generate dynamic routes thats route is undefined
    onGenerateRoute: (RouteSettings){
      return MaterialPageRoute(
        builder: (context) => AlertPage()
      );
    },
  ));
}