import 'package:flutter/material.dart';
import 'package:flutter_wifi_connect/flutter_wifi_connect.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:auto_orientation/auto_orientation.dart';


class SuccessLoginPage extends StatefulWidget {
  const SuccessLoginPage({Key? key}) : super(key: key);

  @override
  State<SuccessLoginPage> createState() => _SuccessLoginPageState();
}

class _SuccessLoginPageState extends State<SuccessLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      width: 400,
      height: 300,
      child: TextButton(onPressed: () {
        Navigator.pop(context);
      },
          child: Icon(Icons.arrow_back_ios, color: Colors.black,)),
    );
  }
}
