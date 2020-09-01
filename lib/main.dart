import 'package:eduro_flutter/pages/conversation.dart';
import 'package:flutter/material.dart';

import 'pages/function.dart';

final String _title = 'Intelligence Robot';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        // height: 1500, // fixed Container Height
        // height: MediaQuery.of(context).size.height,
        // color: Colors.blueAccent,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[ImageComponent(), FunctionMenu()],
        ),
      )),
    );
  }
}
