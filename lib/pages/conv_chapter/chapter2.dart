//chapter 1 Where are you from ?

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

final FlutterTts flutterTts = FlutterTts();
speak(phrase) async {
  await flutterTts.speak(phrase);
}

class Chapter_2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Chapter_2_State();
  }
}

class Chapter_2_State extends State<Chapter_2> {
  @override
  void initState() {
    speak('อาการของโรคโควิด');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("อาการของคนที่เป็นโรคโควิด"),
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
              '1.อ่อนเพลีย',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green[300],
            onPressed: () => {speak('1.อ่อนเพลีย')},
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              '2.หายใจลำบากหรือหายใจถี่',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
            onPressed: () => {speak('2.หายใจลำบากหรือหายใจถี่')},
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              '3.เจ็บหน้าอกหรือแน่นหน้าอก',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green[300],
            onPressed: () => {speak('3.เจ็บหน้าอกหรือแน่นหน้าอก')},
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              '4.มีผื่นบนผิวหนัง หรือนิ้วมือนิ้วเท้าเปลี่ยนสี',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
            onPressed: () =>
                {speak('4.มีผื่นบนผิวหนัง หรือนิ้วมือนิ้วเท้าเปลี่ยนสี')},
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              '5.ปวดศีรษะ',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green[300],
            onPressed: () => {speak('5.ปวดศีรษะ')},
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              '6.ปวดเมื่อยเนื้อตัว',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
            onPressed: () => {speak('6.ปวดเมื่อยเนื้อตัว')},
          ),
        ],
      ),
    );
  }
}
