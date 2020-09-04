import 'package:flutter/material.dart';
import 'package:flutter_02/src/app.dart';
import 'package:flutter_02/src/pages/alert_page.dart';
import 'package:flutter_02/src/pages/avatar_page.dart';
import 'package:flutter_02/src/pages/card_page.dart';

final routes = <String, WidgetBuilder>  {
  '/home':(context) => App(),
  '/alert':(context) => AlertPage(),
  '/avatar': (context) => AvatarPage(),
  '/card': (context) => CardPage()
};