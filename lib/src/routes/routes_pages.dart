import 'package:flutter/material.dart';
import 'package:flutter_02/src/app.dart';
import 'package:flutter_02/src/pages/alert_page.dart';
import 'package:flutter_02/src/pages/animated_container.dart';
import 'package:flutter_02/src/pages/avatar_page.dart';
import 'package:flutter_02/src/pages/card_page.dart';
import 'package:flutter_02/src/pages/input_page.dart';
import 'package:flutter_02/src/pages/listview_page.dart';
import 'package:flutter_02/src/pages/slider_page.dart';

final routes = <String, WidgetBuilder>{
  '/home': (context) => App(),
  '/alert': (context) => AlertPage(),
  '/avatar': (context) => AvatarPage(),
  '/card': (context) => CardPage(),
  '/animatedContainer': (context) => AnimatedContainerPage(),
  '/inputs': (context) => InputPage(),
  '/slider': (context) => SliderPage(),
  '/list': (context) => ListviewPage(),
};
