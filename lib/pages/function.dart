import 'package:eduro_flutter/pages/Assistant/VoiceAssistant.dart';
import 'package:eduro_flutter/pages/Controller/ControlMenu.dart';
import 'package:eduro_flutter/pages/conversation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Chatbot/Chatbot.dart';

final double sizeBox = 10;

class FunctionMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            color: Colors.green[300],
            child: Row(
              children: <Widget>[
                Icon(Icons.book, color: Colors.white),
                SizedBox(width: 20),
                Text(
                  "คำถามเกี่ยวกับโรคโควิด-19",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MaterialApp(
                          theme: ThemeData(primarySwatch: Colors.green),
                          home: ConversationPage())));
            },
          ),
          SizedBox(
            height: sizeBox,
          ),
          /*RaisedButton(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            color: Colors.indigo[900],
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Text(
                  "Chat with Bot",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MaterialApp(home: ChatBot())));
            },
          ),*/
          SizedBox(
            height: sizeBox,
          ),
          RaisedButton(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            color: Colors.green[300],
            child: Row(
              children: <Widget>[
                Icon(Icons.mic, color: Colors.white),
                SizedBox(width: 20),
                Text(
                  "พูดคุยกับคุณหมอ",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MaterialApp(home: VoiceAssistant())));
            },
          ),
          SizedBox(
            height: sizeBox,
          ),
          /*RaisedButton(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            color: Colors.indigo[900],
            child: Row(
              children: <Widget>[
                Icon(Icons.play_arrow, color: Colors.white),
                SizedBox(width: 20),
                Text(
                  "Control",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MaterialApp(home: ControlMenu())));
            },
          ),*/
        ],
      ),
    );
  }
}

class ImageComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Image(
          image: AssetImage('images/robot-vector.png'),
          width: 200,
          height: 200,
        ),
      ],
    );
  }
}
