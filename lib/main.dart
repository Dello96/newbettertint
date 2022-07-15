import 'package:flutter/material.dart';
import 'package:flutter_wifi_connect/flutter_wifi_connect.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/cupertino.dart';
import 'package:newbettertint/Pages/successLogin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((value) => runApp(MyApp()));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _ssid = 'GLATIC_L_W001';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String ssid;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      ssid = await FlutterWifiConnect.ssid;
    } on PlatformException {
      ssid = 'GLATIC_L_W001';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ssid = ssid;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Admin'),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Container(
                      alignment: Alignment.topRight,
                      child: TextButton(onPressed: () {
                        AutoOrientation.fullAutoMode();
                      }, child: Icon(Icons.change_circle_outlined,
                      color: Colors.black)),
                    ),
                  )
                ],
              ),
              Container(
                width: 400,
                height: 200,
                child: TextButton(
                    onPressed: () {
                      FlutterWifiConnect.ssid;
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => SuccessLoginPage()));
                    },
                    child: Text('Connect',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlueAccent
                    ),)),
              )
            ],
          )
        ),
      ),
    );
  }
}