import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatpadapp/constants.dart';
import 'package:flutter/material.dart';

class StatusScreen extends StatefulWidget {
  static const String id = 'status_screen';
  final String emailMessage;
  final String passwordMessage;
  final String actionMessage;

  StatusScreen({
    this.emailMessage,
    this.passwordMessage,
    this.actionMessage,
  });

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              setState(() {});
              Navigator.pop(context);
            },
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
                          'Email',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Stardos',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      widget.emailMessage == 'success'
                          ? Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
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
                          'Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Stardos',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      widget.passwordMessage == 'success'
                          ? Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
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
                          'Action',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Stardos',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      widget.actionMessage == 'success'
                          ? Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120,
                        child: Text(
                          'Reason',
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Stardos',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      widget.emailMessage != 'success'
                          ? TypewriterAnimatedTextKit(
                              speed: Duration(milliseconds: 150),
                              totalRepeatCount: 5,
                              text: [
                                widget.emailMessage,
                              ],
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(color: kTextWhite),
                            )
                          : Visibility(visible: false, child: Text('-')),
                      widget.passwordMessage != 'success'
                          ? TypewriterAnimatedTextKit(
                              speed: Duration(milliseconds: 150),
                              totalRepeatCount: 5,
                              text: [
                                widget.passwordMessage,
                              ],
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(color: kTextWhite),
                            )
                          : Visibility(visible: false, child: Text('-')),
                      widget.actionMessage != 'success'
                          ? RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Invalid Action - ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Stardos',
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Action can only have ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Stardos',
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'login',
                                    style: TextStyle(
                                      color: kTextGreen,
                                      fontFamily: 'Stardos',
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' or ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Stardos',
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'create.',
                                    style: TextStyle(
                                      color: kTextGreen,
                                      fontFamily: 'Stardos',
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Visibility(
                              visible: false,
                              child: Text('-'),
                            ),
                    ],
                  ),
                ),
                Divider(thickness: 1, color: Colors.grey.shade500),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
