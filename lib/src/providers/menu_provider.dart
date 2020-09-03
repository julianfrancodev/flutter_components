import 'dart:convert';

import 'package:flutter/services.dart';

class _MenuProvider{
  List<dynamic> options = [];

  _MenuProvider(){
  }

  Future <List<dynamic>>loadData() async{
   final data  = await rootBundle.loadString('assets/menu_opts.json');
      Map dataMap = json.decode(data);
      var options = dataMap['rutas'];
      return options;
  }
}
 var menuProvider = new _MenuProvider();
