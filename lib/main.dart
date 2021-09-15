import 'package:flutter/material.dart';
import "item.dart";
import "condition.dart";
import "effect.dart";


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var _version = "v1.1";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ItemBuilder Command Generator' + _version.toString(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ItemBuilder Command Generator' + _version.toString()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Item _item = new Item();
  String _result = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _setItemType(s) {
    setState(() {
      _item.itemType = s;
      _updateResult();
    });
  }

  void _setActType(s) {
    setState(() {
      _item.actType = s;
      _updateResult();
    });
  }

  void _updateResult() {
    _result = _item.parseToNbt();
  }

  @override
  Widget build(BuildContext context) {
    // User Interface
    List<Widget> treeList = _item.parseToScaffold(this);
    // Spacing
    treeList.add(Text(
        " ", style: Theme.of(context).textTheme.headline4
    ));
    // Resulting Command
    _updateResult();
    treeList.add(SelectableText(
        _result, style: Theme.of(context).textTheme.headline4
    ));
    // Chat Length Warning
    if (_result.length > 256) {
      treeList.add(SelectableText(
          "Warning: Command length > 256 characters; must be run using a command block!",
          style: TextStyle(color: Colors.red, fontSize: 20),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder (
          scrollDirection: Axis.vertical,
          itemCount: treeList.length,
          itemBuilder: (BuildContext context, int index) {
            return treeList[index];
          }
      )
      ),
    );
  }
}
