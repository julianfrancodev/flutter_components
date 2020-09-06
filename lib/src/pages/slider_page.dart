import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100;

  bool _blockCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              _renderSlider(),
              _renderCheckBox(),
              _renderSwitch(),
              Expanded(child: _renderImage()),
            ],
          )),
    );
  }

  Widget _renderSlider() {
    return Slider(
      value: _sliderValue,
      label: "Image Size",
      min: 10,
      max: 400,
      onChanged: (_blockCheckBox)
          ? null
          : (value) {
              setState(() {
                _sliderValue = value;
              });
            },
    );
  }

  Widget _renderImage() {
    return FadeInImage(
      fit: BoxFit.contain,
      width: _sliderValue,
      placeholder: AssetImage('assets/images/jar-loading.gif'),
      image: NetworkImage(
          'https://ichef.bbci.co.uk/news/400/cpsprodpb/26AC/production/_107000990_grumpycat5.jpg'),
    );
  }

  Widget _renderCheckBox() {
    // return Checkbox(
    //   value: _blockCheckBox,
    //   onChanged: (value) {
    //     setState(() {
    //       _blockCheckBox = value;
    //     });
    //   },
    // );

    return CheckboxListTile(
      title: Text("Block Slider"),
      value: _blockCheckBox,
      onChanged: (value) {
        setState(() {
          _blockCheckBox = value;
        });
      },
    );
  }

  Widget _renderSwitch() {
    return Switch(
      value: _blockCheckBox,
      onChanged: (value) {
        setState(() {
          _blockCheckBox = value;
        });
      },
    );
  }
}
