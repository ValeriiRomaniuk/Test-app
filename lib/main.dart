// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App',
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _tapInProgress = false;

  void _onTap() {
    setState(() {
      _tapInProgress = true;
    });
  }

  void standartColor() {
    setState(() {
      _tapInProgress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget redSection = new GestureDetector(
      onTap: _onTap,
      child: new Container(
        color: _tapInProgress ? Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0) : Colors.black,
        child: new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Hey There",
                style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 36.0,
                )),
            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(
                      padding: const EdgeInsets.all(8.0),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: standartColor,
                      child: new Text("Black screen")),
                  new RaisedButton(
                      padding: const EdgeInsets.all(8.0),
                      textColor: Colors.white,
                      color: Colors.red,
                      onPressed: () => exit(0),
                      child: new Text("Exit"))
                ])
          ],
        )),
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Random Color Generator"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        child: redSection,
      ),
    );
  }
}
