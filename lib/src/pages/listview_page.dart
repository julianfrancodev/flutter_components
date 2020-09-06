import 'dart:async';

import 'package:flutter/material.dart';

class ListviewPage extends StatefulWidget {
  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  ScrollController _scrollController = new ScrollController();
  bool _isLoading = false;
  List<int> _listn = new List();
  int _lastItem = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addNewImages();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _isLoading = true;
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: Stack(
        children: [_renderList(), _renderLoading()],
      ),
    );
  }

  Widget _renderList() {
    return RefreshIndicator(
      onRefresh: () => getPage(),
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _listn.length,
          itemBuilder: (context, i) {
            final numbers = _listn[i];
            return FadeInImage(
              placeholder: AssetImage('assets/images/jar-loading.gif'),
              image: NetworkImage(
                  'https://picsum.photos/500/500?random=${numbers}'),
            );
          }),
    );
  }

  Future<Null> getPage() async {
    final duration = Duration(milliseconds: 200);
     new Timer(duration, () {
      _listn.clear();
      _lastItem++;
      addNewImages();
    });

     return Future.delayed(duration);
  }

  void addNewImages() {
    for (int i = 0; i <= 10; i++) {
      _lastItem++;
      _listn.add(_lastItem);
    }

    setState(() {});
  }

  Future fetchData() async {
    setState(() {
      _isLoading = true;
    });
    final duration = new Duration(seconds: 2);
    new Timer(duration, httpResponse);
  }

  void httpResponse() {
    setState(() {
      _isLoading = false;
    });

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);

    addNewImages();
  }

  Widget _renderLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
