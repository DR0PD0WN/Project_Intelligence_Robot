//chapter 1 Where are you from ?

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

final FlutterTts flutterTts = FlutterTts();
speak(phrase) async {
  await flutterTts.speak(phrase);
}

class Chapter_3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Chapter_3_State();
  }
}

class Chapter_3_State extends State<Chapter_3> {
  @override
  void initState() {
    speak('การบำบัดรักษาโรคโควิด');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("การบำบัดรักษาโรคโควิด-19"),
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
              'การดูแลตนเอง',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green[300],
            onPressed: () => {speak('การดูแลตนเอง')},
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              "ข้อที่ 1",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
            onPressed: () => {
              speak(
                  "หากรู้สึกไม่สบาย คุณควรพักผ่อน ดื่มน้ำมากๆ และรับประทานอาหารที่มีประโยชน์ กักตัวเองในห้องแยกจากสมาชิกครอบครัวคนอื่นๆ")
            },
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              'ข้อที่ 2',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
            onPressed: () => {
              speak(
                  'เมื่ออยู่ที่บ้าน ทุกคนควรทำกิจวัตรประจำวันที่ดีต่อสุขภาพ โดยการรับประทานอาหารที่มีประโยชน์ นอนหลับให้เพียงพอ ออกกำลังกายเป็นประจำ')
            },
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              "ข้อที่ 3",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
            onPressed: () => {
              speak(
                  'ความรู้สึกเศร้า ตึงเครียด หรือสับสนเป็นเรื่องปกติในช่วงวิกฤต การพูดคุยกับคนที่ไว้ใจ เช่น เพื่อนหรือครอบครัวช่วยแก้ปัญหาเหล่านี้ได้ แต่หากรู้สึกเป็นกังวลมาก โปรดติดต่อพูดคุยกับบุคลากรทางการแพทย์หรือนักจิตวิทยาการปรึกษา')
            },
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              'การรักษาทางการแพทย์',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green[300],
            onPressed: () => {speak('การรักษาทางการแพทย์')},
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              "ข้อที่ 1",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
            onPressed: () => {
              speak(
                  'หากมีอาการเพียงเล็กน้อยและไม่มีปัญหาสุขภาพอื่นๆ โปรดแยกกักกันตัวเอง หรือติดต่อผู้ให้บริการทางการแพทย์หรือสายด่วนข้อมูลโควิด-19 เพื่อขอคำแนะนำ')
            },
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: buttonHeight),
            child: Text(
              'ข้อที่ 2',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
            onPressed: () => {
              speak('โปรดไปพบแพทย์หากมีไข้ ไอ และหายใจลำบาก โดยติดต่อล่วงหน้า')
            },
          ),
        ],
      ),
    );
  }
}
