import 'dart:async';

import 'package:chatpadapp/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushNamed(context, LoginScreen.id);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Center(
            child: Text(
              "Loading",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Stardos',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          JumpingDotsProgressIndicator(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
