import 'package:chatpadapp/constants.dart';
import 'package:chatpadapp/screen/chat_screen.dart';
import 'package:chatpadapp/screen/contacts_screen.dart';
import 'package:chatpadapp/screen/login_screen.dart';
import 'package:chatpadapp/screen/splash_screen.dart';
import 'package:chatpadapp/screen/status_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatPad',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black, fontFamily: 'Stardos'),
          bodyText2: TextStyle(color: Colors.black, fontFamily: 'Stardos'),
          button: TextStyle(color: Colors.black, fontFamily: 'Stardos'),
        ),
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        LoginScreen.id: (context) => LoginScreen(),
        StatusScreen.id: (context) => StatusScreen(),
        ContactScreen.id: (context) => ContactScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
