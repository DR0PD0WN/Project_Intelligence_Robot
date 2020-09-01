import 'package:eduro_flutter/pages/conv_chapter/chapter1.dart';
import 'package:eduro_flutter/pages/conv_chapter/chapter2.dart';
import 'package:eduro_flutter/pages/conv_chapter/chapter3.dart';
import 'package:eduro_flutter/pages/conv_chapter/chapter4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// -- Globla Var Zone --
final String _header = 'คำถามเกี่ยวกับโรคโควิด-19';

// -- End Var --
class ConversationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(_header),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: _screenWidth,
          child: Column(
            children: <Widget>[ChapterBox()],
          ),
        ),
      ),
    );
  }
}

class ChapterBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          OutlineButton(
            child: Text("วิธีป้องกันการแพร่ระบาดของโควิด-19"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Chapter_1()));
            },
          ),
          OutlineButton(
            child: Text("อาการของโรคโควิด-19"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Chapter_2()));
            },
          ),
          OutlineButton(
            child: Text("การบำบัดรักษาโรคโควิด-19"),
            padding: new EdgeInsets.fromLTRB(100, 0, 100, 0),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Chapter_3()));
            },
          ),
          OutlineButton(
            child: Text("ค่าใช้จ่ายต่างๆ"),
            padding: new EdgeInsets.fromLTRB(100, 0, 100, 0),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Chapter_4()));
            },
          ),
        ],
      ),
    );
  }
}
