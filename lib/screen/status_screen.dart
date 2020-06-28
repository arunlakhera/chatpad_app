import 'package:chatpadapp/constants.dart';
import 'package:chatpadapp/screen/contacts_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StatusScreen extends StatefulWidget {
  static const String id = 'status_screen';
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: deviceSize.height > deviceSize.width
                ? deviceSize.height - 30
                : deviceSize.width - 30,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo with Name
                Container(
                  alignment: Alignment.center,
                  margin:
                      EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 40),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'C', style: kLogoTextStyleBold),
                        TextSpan(text: 'hat', style: kLogoTextStyleNormal),
                        TextSpan(text: 'P', style: kLogoTextStyleBold),
                        TextSpan(text: 'ad', style: kLogoTextStyleNormal),
                      ],
                    ),
                  ),
                ),
                //Status Title
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/text_base.png'),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Text(
                          'Status:',
                          style: TextStyle(
                            color: kTextGreen,
                            fontSize: 20,
                            fontFamily: 'Stardos',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Divider(thickness: 1, color: Colors.grey.shade500),

                // username Status
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 120,
                        child: Text(
                          'email',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Stardos',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(Icons.check, color: kTextGreen),
                    ],
                  ),
                ),
                //password status
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        child: Text(
                          'password',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Stardos',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(Icons.check, color: kTextGreen),
                    ],
                  ),
                ),
                // reason
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        child: Text(
                          'status',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Stardos',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(Icons.check, color: kTextGreen),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Divider(thickness: 1, color: Colors.grey.shade500),
                SizedBox(height: 40),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamed(context, ContactScreen.id);
                    });
                  },
                  textColor: Colors.black,
                  color: kWindowBackground,
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 30,
                  ),
                  child: Text(
                    'Continue...',
                    style: TextStyle(fontSize: 15),
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
