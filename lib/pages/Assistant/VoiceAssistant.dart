import 'package:eduro_flutter/pages/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';
import 'package:hardware_buttons/hardware_buttons.dart' as HardwareButtons;
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_recognition_error.dart';

// Global Var! Zone
final FlutterTts flutterTts = FlutterTts(); // Create FlutterTTS Instance
final String _instruction =
    'คุณสามารถถามคำถามเกี่ยวกับด้านสุขภาพได้ผ่านทางหุ่นยนต์';
final String _wordBox = '';

// --- End Global Var
class VoiceAssistant extends StatefulWidget {
  @override
  _VoiceAssistantState createState() => _VoiceAssistantState();
}

class _VoiceAssistantState extends State<VoiceAssistant> {
  final SpeechToText speech =
      SpeechToText(); // Create Voice Recognition Instance
  StreamSubscription<HardwareButtons.VolumeButtonEvent>
      _volumeButtonSubscription; // Create Hardware Button Event Handler

  bool _hasSpeech = false;
  bool speakStatus = true;

  String _latestHardwareButtonEvent;
  String lastWords = "";
  String lastError = "";
  String lastStatus = "";

  // Initialize State
  @override
  void initState() {
    super.initState();
    _volumeButtonSubscription =
        HardwareButtons.volumeButtonEvents.listen((event) {
      setState(() {
        _latestHardwareButtonEvent = event.toString();
        print("Test Msg : " + _latestHardwareButtonEvent);
      });
    });
    initSpeechState();
  }

  // State clear
  @override
  void dispose() {
    super.dispose();
    _volumeButtonSubscription?.cancel();
  }

  void Speak(Words) async {
    // Text-to-Speech
    await flutterTts.setLanguage("th-TH");
    await flutterTts.speak(Words);
  }

  // --! It May be bugg! lol -->

  void DialogResp(query) async {
    print("Dialog Resp Status ");
    print(speakStatus);
    speakStatus = false;
    try {
      AuthGoogle authGoogle =
          await AuthGoogle(fileJson: "asset/dialogflow-api.json").build();
      Dialogflow dialogflow =
          Dialogflow(authGoogle: authGoogle, language: Language.thai);
      AIResponse response = await dialogflow.detectIntent(query);
      Speak(response.getMessage());
    } catch (nullException) {
      print('null detected');
    }
  }
  // -- > Caution! It maybe bugg! I warn you !
  // -- > I warn you again Query still BUGGGGGG

  // -- > Initialize Voice Recognition Function
  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener);

    if (!mounted) return;
    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

  void startListening() {
    lastWords = "";
    lastError = "";
    speech.listen(onResult: resultListener);
    setState(() {});
  }

  void stopListening() {
    speech.stop();
    setState(() {});
  }

  void cancelListening() {
    speech.cancel();
    setState(() {});
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      lastWords = "${result.recognizedWords}";
      DialogResp(lastWords);
    });
  }

  void errorListener(SpeechRecognitionError error) {
    setState(() {
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }

  void statusListener(String status) {
    setState(() {
      lastStatus = "$status";
    });
  }
  // --- > End Voice Recognition Function !

  @override
  Widget build(BuildContext context) {
    // Remote Checking
    if (_latestHardwareButtonEvent == 'VolumeButtonEvent.VOLUME_UP') {
      print('Ready');
      startListening();
      _latestHardwareButtonEvent = "";
    }
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('ตอบคำถามด้านสุขภาพ'),
      ),
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        // color: Colors.blueAccent,
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: deviceWidth / 10, vertical: deviceHeight / 20),
          // color: Colors.grey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  // Intruction
                  // color: Colors.red,
                  width: deviceWidth * 0.7,
                  child: Text(_instruction),
                ),
                Text('กดปุ่มเพื่อพูด'),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: deviceWidth * 0.6,
                    height: deviceHeight * 0.08,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.0)),
                    child: Text(lastWords)),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        // width: 225,
                        // height: 225,
                        child: FloatingActionButton(
                          child: Icon(
                            Icons.mic,
                            // size: 125,
                          ),
                          backgroundColor: Colors.redAccent,
                          onPressed: () async {
                            startListening();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        child: Text(
                          "หยุด",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        color: Colors.redAccent,
                        padding: EdgeInsets.symmetric(
                            horizontal: deviceWidth * 0.05,
                            vertical: deviceHeight * 0.02),
                        onPressed: () => {
                          stopListening(),
                          flutterTts.stop(),
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
