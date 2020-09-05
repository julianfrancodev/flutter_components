import 'package:flutter/material.dart';

class AvatarPage extends StatefulWidget {
  @override
  _AvatarPageState createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar"),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://dam.menshealthlatam.com/wp-content/uploads/2018/11/STANLEE.jpg',),
                radius: 25,
              ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://dam.menshealthlatam.com/wp-content/uploads/2018/11/STANLEE.jpg'),
          placeholder: AssetImage('assets/images/jar-loading.gif'),
        ),
      ),
    );
  }
}
