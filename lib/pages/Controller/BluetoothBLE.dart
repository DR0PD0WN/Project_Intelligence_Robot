import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothBLE extends StatefulWidget {
  @override
  _BluetoothBLEState createState() => _BluetoothBLEState();
}

class _BluetoothBLEState extends State<BluetoothBLE> {
  final String SERVICE_UUID = "0000ffe0-0000-1000-8000-00805f9b34fb";
  final String CHARACTERISTIC_UUID = "0000ffe1-0000-1000-8000-00805f9b34fb";
  final String TARGET_DEVICE_NAME = "MLT-BT05";

  FlutterBlue flutterBlue = FlutterBlue.instance;
  StreamSubscription<ScanResult> scanSubScription;

  BluetoothDevice targetDevice;
  BluetoothCharacteristic targetCharacteristic;

  String connectionText = "Not Connected";

  final double buttonDim = 25;
  final double fontSize = 14;

  @override
  void initState() {
    super.initState();
    // startScan();
  }

  startScan() {
    setState(() {
      connectionText = "Start Scanning";
    });

    scanSubScription = flutterBlue.scan().listen((scanResult) {
      if (scanResult.device.name == TARGET_DEVICE_NAME) {
        print('DEVICE found');
        stopScan();
        setState(() {
          connectionText = "Found Target Device";
        });

        targetDevice = scanResult.device;
        connectToDevice();
      }
    }, onDone: () => stopScan());
  }

  stopScan() {
    scanSubScription?.cancel();
    scanSubScription = null;
  }

  connectToDevice() async {
    if (targetDevice == null) return;

    setState(() {
      connectionText = "Device Connecting";
    });

    await targetDevice.connect();
    print('DEVICE CONNECTED');
    setState(() {
      connectionText = "Device Connected";
    });

    discoverServices();
  }

  disconnectFromDevice() {
    if (targetDevice == null) return;

    targetDevice.disconnect();
    print("DISCONNECT");
    setState(() {
      connectionText = "Device Disconnected";
    });
  }

  discoverServices() async {
    if (targetDevice == null) return;

    List<BluetoothService> services = await targetDevice.discoverServices();
    services.forEach((service) {
      // do something with service
      if (service.uuid.toString() == SERVICE_UUID) {
        service.characteristics.forEach((characteristic) {
          if (characteristic.uuid.toString() == CHARACTERISTIC_UUID) {
            targetCharacteristic = characteristic;
            writeData("Hi there, ESP32!!");
            setState(() {
              connectionText = "All Ready with ${targetDevice.name}";
            });
          }
        });
      }
    });
  }

  writeData(String data) {
    if (targetCharacteristic == null) return;
    print("Write : " + data);
    List<int> bytes = utf8.encode(data);
    targetCharacteristic.write(bytes);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Expanded(
          child: Column(
            children: <Widget>[
              Center(
                child: Text(connectionText),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                child: Text(
                  "Scan",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                color: Colors.blueAccent,
                onPressed: () {
                  startScan();
                  print("Force Connect");
                },
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizeBoxSpace(),
                        RaisedButton(
                          color: Colors.redAccent,
                          padding: EdgeInsets.symmetric(
                            vertical: buttonDim,
                          ),
                          child: Text('Forward',
                              style: TextStyle(
                                  fontSize: fontSize, color: Colors.white)),
                          onPressed: () {
                            print("Pressed F");
                            writeData("forward");
                          },
                        ),
                        SizeBoxSpace(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.redAccent,
                          padding: EdgeInsets.symmetric(
                            vertical: buttonDim,
                          ),
                          child: Text(
                            'Left',
                            style: TextStyle(
                                fontSize: fontSize, color: Colors.white),
                          ),
                          onPressed: () {
                            print("Pressed L");
                            writeData("left");
                          },
                        ),
                        SizedBox(width: 10),
                        RaisedButton(
                          color: Colors.redAccent,
                          padding: EdgeInsets.symmetric(
                            vertical: buttonDim,
                          ),
                          child: Text('Backward',
                              style: TextStyle(
                                  fontSize: fontSize, color: Colors.white)),
                          onPressed: () {
                            print("Pressed B");
                            writeData("backward");
                          },
                        ),
                        SizedBox(width: 10),
                        RaisedButton(
                          color: Colors.redAccent,
                          padding: EdgeInsets.symmetric(
                            vertical: buttonDim,
                          ),
                          child: Text('Right',
                              style: TextStyle(
                                  fontSize: fontSize, color: Colors.white)),
                          onPressed: () {
                            print("Pressed R");
                            writeData("right");
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizeBoxSpace(),
                        RaisedButton(
                          color: Colors.redAccent,
                          padding: EdgeInsets.symmetric(
                            vertical: buttonDim,
                          ),
                          child: Text('Stop',
                              style: TextStyle(
                                  fontSize: fontSize, color: Colors.white)),
                          onPressed: () {
                            print("Pressed S");
                            writeData("stop");
                          },
                        ),
                        SizeBoxSpace(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class SizeBoxSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.blueAccent,
      // ),
      child: SizedBox(
        width: 100,
        height: 100,
      ),
    );
  }
}
