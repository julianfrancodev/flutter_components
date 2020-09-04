import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _renderCard1(),
          SizedBox(
            height: 30,
          ),
          _renderCard2(),
        ],
      ),
    );
  }

  Widget _renderCard1() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.photo,
              color: Colors.blue,
            ),
            title: Text("Title Card"),
            subtitle: Text("Subtitle card for testing the cards in flutter"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _renderCard2() {
    final Widget imageCard = Container(
      child: Column(
        children: [
          FadeInImage(
            height: 300,
            fit: BoxFit.fill,
            placeholder: AssetImage('assets/images/jar-loading.gif'),
            image: NetworkImage(
                'https://i.pinimg.com/564x/30/c7/81/30c781e2fc4784f68580c89281971505.jpg'),
          ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          //   child: Image(
          //     image: NetworkImage(
          //       'https://i.pinimg.com/564x/30/c7/81/30c781e2fc4784f68580c89281971505.jpg',
          //     ),
          //
          //   ),
          // ),

          Container(
            padding: EdgeInsets.only(bottom: 20, top: 20),
            child: Text("Description Image"),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(2.0, 10.0)),
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: imageCard,
      ),
    );
  }
}
