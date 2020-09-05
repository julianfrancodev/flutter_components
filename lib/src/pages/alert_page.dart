import 'package:flutter/material.dart';

class AlertPage extends StatefulWidget {
  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => _showAlert(context),
          child: Text("Show Alert"),
          textColor: Colors.white,
          shape: StadiumBorder(),
          color: Colors.amber,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  void _showAlert(context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: Text("Title"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('content'),
                FlutterLogo(size: 100,)
              ],
            ),
            actions: [
              FlatButton(
                child: Text("Cancel"),
                onPressed: ()=> Navigator.of(context).pop(),
              ),

              FlatButton(
                child: Text("Ok"),
                onPressed: (){},
              ),
            ],
          );
        });
  }
}
