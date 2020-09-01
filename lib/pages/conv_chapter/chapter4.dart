//chapter 1 Where are you from ?

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

final FlutterTts flutterTts = FlutterTts();
speak(phrase) async {
  await flutterTts.speak(phrase);
}

class Chapter_4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Chapter_4_State();
  }
}

class Chapter_4_State extends State<Chapter_4> {
  @override
  void initState() {
    speak('ค่าตรวจโรคโควิด');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ค่าตรวจโรคโควิด-19"),
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
              'โรงพยาบาลของรัฐ',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
            onPressed: () => {speak('โรงพยาบาลของรัฐ')},
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              "ค่าใช้จ่ายจะอยู่ประมาณ 2,500-9,900 บาท",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green[300],
            onPressed: () => {speak("ค่าใช้จ่ายจะอยู่ประมาณ 2,500-9,900 บาท")},
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              'โรงพยาบาลเอกชน',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
            onPressed: () => {speak('โรงพยาบาลเอกชน')},
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              "ค่าใช้จ่ายจะอยู่ประมาณ 5,000-10,000 บาท",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green[300],
            onPressed: () => {speak('ค่าใช้จ่ายจะอยู่ประมาณ 5,000-10,000 บาท')},
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              'กรณีเดินทางกลับจากประเทศกลุ่มเสี่ยง',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
            onPressed: () => {
              speak(
                  'กรณีมีอาการ แพทย์จะส่งตรวจหาเชื้อโคโรนาไวรัสฟรี ในกรณีที่ติดเชื้อโคโรนาไวรัสขึ้นมาจริง ๆ ก็จะได้รับการรักษาโดยไม่เสียค่าใช้จ่าย แต่ถ้าหากยังไม่มีอาการ กรณีนี้ประกันสังคมไม่ครอบคลุมการตรวจ หากเราอยากตรวจหาเชื้อจริง ๆ จะต้องเสียค่าใช้จ่ายเอง')
            },
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              "กรณีไม่ได้เดินทางไปประเทศกลุ่มเสี่ยง",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green[300],
            onPressed: () => {
              speak(
                  "กรณีไม่ได้เดินทางไปประเทศกลุ่มเสี่ยงแต่ต้องการตรวจ จะต้องเสียค่าใช้จ่ายในการตรวจเอง ประมาณ 3,000-9,900 บาท")
            },
          ),
        ],
      ),
    );
  }
}
