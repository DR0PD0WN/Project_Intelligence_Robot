//chapter 1 Where are you from ?

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

final FlutterTts flutterTts = FlutterTts();
speak(phrase) async {
  await flutterTts.speak(phrase);
}

class Chapter_1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Chapter_1_State();
  }
}

class Chapter_1_State extends State<Chapter_1> {
  @override
  void initState() {
    speak('วิธีป้องกันโรคโควิด');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("วิธีป้องกันการแพร่ระบาดของโควิด-19"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[DialogContainer()],
        ),
      ),
    );
  }
}

class DialogContainer extends StatelessWidget {
  final double buttonHeight = 15.00;
  final double boxHeight = 10.00;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              '1.ล้างมือบ่อยๆโดยใช้สบู่และน้ำหรือเจลล้างมือที่มีส่วนผสมหลักเป็นแอลกอฮอล์',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green[300],
            onPressed: () => {
              speak(
                  '1.ล้างมือบ่อยๆ โดยใช้สบู่และน้ำ หรือเจลล้างมือที่มีส่วนผสมหลักเป็นแอลกอฮอล์')
            },
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              '2.รักษาระยะห่างที่ปลอดภัยจากผู้ที่ไอหรือจาม',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
            onPressed: () =>
                {speak('2.รักษาระยะห่างที่ปลอดภัยจากผู้ที่ไอหรือจาม')},
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              '3.สวมหน้ากากอนามัยเมื่อเว้นระยะห่างไม่ได้',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green[300],
            onPressed: () =>
                {speak('3.สวมหน้ากากอนามัยเมื่อเว้นระยะห่างไม่ได้')},
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              '4.ไม่สัมผัสตา จมูก หรือปาก',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
            onPressed: () => {speak('4.ไม่สัมผัสตา จมูก หรือปาก')},
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              '5.ปิดจมูกและปากด้วยข้อพับด้านในข้อศอกหรือกระดาษชำระเมื่อไอหรือจาม',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green[300],
            onPressed: () => {
              speak(
                  '5.ปิดจมูกและปากด้วยข้อพับด้านในข้อศอกหรือกระดาษชำระเมื่อไอหรือจาม')
            },
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              '6.เก็บตัวอยู่บ้านเมื่อรู้สึกไม่สบาย',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
            onPressed: () => {speak('6.เก็บตัวอยู่บ้านเมื่อรู้สึกไม่สบาย')},
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              '7.หากมีไข้ ไอ และหายใจลำบากโปรดไปพบแพทย์',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green[300],
            onPressed: () =>
                {speak('7.หากมีไข้ ไอ และหายใจลำบากโปรดไปพบแพทย์')},
          ),
          /*RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              'I am from Thailand.',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blueAccent,
            onPressed: () => {speak('I am from Thailand')},
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              'Nice to meet you.',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.indigo[900],
            onPressed: () => {speak('Nice to meet you')},
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              'Nice to meet you too.',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blueAccent,
            onPressed: () => {speak('Nice to meet you too')},
          ),*/
        ],
      ),
    );
  }
}
