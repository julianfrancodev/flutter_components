import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.blue;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
          duration: Duration(milliseconds: 200),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var random = new Random();

          setState(() {
            _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255),
                random.nextInt(255), 1);
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();
            _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
            ;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
