import 'package:flutter/material.dart';
import 'package:flutter_02/src/pages/alert_page.dart';
import 'package:flutter_02/src/routes/routes_pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main (){
  runApp(MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('es','CO'),
      const Locale('en','US')
    ],
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