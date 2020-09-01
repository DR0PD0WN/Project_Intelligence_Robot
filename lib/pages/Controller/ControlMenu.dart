import 'package:flutter/material.dart';
import 'BluetoothBLE.dart';


class ControlMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Kanit'),
        home: Scaffold(
          appBar: AppBar(title: Text("Control Mode")),
          body: Column(
            children: <Widget>[
              BluetoothBLE()
            ],
          ),
        ));
  }
}
