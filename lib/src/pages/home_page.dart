import 'package:flutter/material.dart';
import 'package:flutter_02/src/pages/alert_page.dart';
import 'package:flutter_02/src/providers/menu_provider.dart';
import 'package:flutter_02/src/util/icons_string_util.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> options = ['uno', 'dos', 'tre', 'cuatro'];

  @override
  Widget build(BuildContext context) {
    return _listFromFuture();
  }

  // prefer don't use this
  List<Widget> renderItems() {
    List<Widget> list = new List<Widget>();

    for (String opt in options) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      list..add(tempWidget)..add(Divider());
    }

    return list;
  }

  List<Widget> renderShortItems() {
    var widgets = options.map((e) {
      return Column(
        children: [
          ListTile(
            title: Text('${e}'),
            subtitle: Text("subtitle"),
            leading: Icon(Icons.widgets),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();

    return widgets;
  }

  Widget _listFromFuture() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, snapshot) {
        print(snapshot.data);
        if(snapshot.hasData){
          return ListView(
            children: _rederList(snapshot.data, context),
          );
        }
        return Container();
      },
    );
  }
}

List<Widget> _rederList(List<dynamic> data, BuildContext context) {
  final List<Widget> options = [];

  data.forEach((element) {
    final widgetTemp = ListTile(
      title: Text(element['texto']),
      leading: getIcons(element['icon']),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // final route = MaterialPageRoute(
        //   builder: (context) => AlertPage()
        // );
        // Navigator.push(context, route);

        Navigator.pushNamed(context, element['ruta']);
      },
    );
    options..add(widgetTemp)..add(Divider());
  });

  return options;
}
