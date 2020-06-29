import 'package:chatpadapp/constants.dart';
import 'package:chatpadapp/model/auth_exception_handler.dart';
import 'package:chatpadapp/model/auth_result_status.dart';
import 'package:chatpadapp/model/firebase_auth_helper.dart';
import 'package:chatpadapp/screen/contacts_screen.dart';
import 'package:chatpadapp/screen/status_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Firestore _firestore = Firestore.instance;

  String emailIdError = 'success';
  String passwordError = 'success';
  String actionError = 'success';
  bool _saving = false;

  String emailId;
  String password;
  TextEditingController controllerType;

  @override
  void initState() {
    controllerType = TextEditingController(text: 'login');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: _saving,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: deviceSize.height > deviceSize.width
                  ? deviceSize.height - 30
                  : deviceSize.width - 30,
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Column(
                    children: [
                      // Logo with Name
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            top: 40, left: 30, right: 30, bottom: 40),
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
                              TextSpan(
                                  text: 'hat', style: kLogoTextStyleNormal),
                              TextSpan(text: 'P', style: kLogoTextStyleBold),
                              TextSpan(text: 'ad', style: kLogoTextStyleNormal),
                            ],
                          ),
                        ),
                      ),
                      //Email TextField
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/text_base.png'),
                        )),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'email:\\',
                                style: TextStyle(
                                  color: kTextGreen,
                                  fontSize: 16,
                                  fontFamily: 'Stardos',
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: true,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'enter email here',
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade600,
                                      fontFamily: 'Stardos',
                                    ),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 2),
                                  ),
                                  onChanged: (newText) {
                                    setState(() {
                                      emailId = newText;
                                    });
                                    print(emailId);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //Password TextField
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/text_base.png'),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'password:\\',
                                style: TextStyle(
                                  color: kTextGreen,
                                  fontFamily: 'Stardos',
                                  fontSize: 16,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  autofocus: true,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(color: Colors.white),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'enter password here',
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Stardos',
                                      color: Colors.grey.shade600,
                                    ),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 2),
                                  ),
                                  onChanged: (newText) {
                                    setState(() {
                                      password = newText;
                                    });
                                    print(password);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //Controller type i.e. login / forgot password
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/text_base.png'),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Action',
                                style: TextStyle(color: Colors.white),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'CP:\\',
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontFamily: 'Stardos',
                                      fontSize: 18,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      textAlign: TextAlign.start,
                                      controller: controllerType,
                                      textCapitalization:
                                          TextCapitalization.none,
                                      style: TextStyle(
                                        color: controllerType.text == 'login' ||
                                                controllerType.text == 'create'
                                            ? Colors.white
                                            : Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Stardos',
                                        fontSize: 20,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'login',
                                        hintStyle: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey.shade600,
                                          fontFamily: 'Stardos',
                                        ),
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 2),
                                      ),
                                      onChanged: (newText) {
                                        controllerType = TextEditingController(
                                            text: newText);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      //Button to login or signup or forgot password
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            _saving = true;
                          });

                          if (controllerType.text == 'login' ||
                              controllerType.text == 'create') {
                            actionError = 'success';
                          } else {
                            actionError = 'Invalid Action';
                          }

                          if (emailId != null) {
                            emailIdError = 'success';
                          } else {
                            emailIdError = 'Email ID cannot be empty.';
                          }

                          if (password != null) {
                            passwordError = 'success';
                          } else {
                            passwordError = 'Invalid';
                            passwordError = 'Password cannot be empty.';
                          }

                          if (actionError != 'success' ||
                              emailIdError != 'success' ||
                              passwordError != 'success') {
                            setState(() {
                              _saving = false;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StatusScreen(
                                  emailMessage: emailIdError,
                                  passwordMessage: passwordError,
                                  actionMessage: actionError,
                                ),
                              ),
                            );
                          } else {
                            if (controllerType.text == 'create') {
                              _createAccount();
                            } else if (controllerType.text == 'login') {
                              _login();
                            } else {
                              setState(() {
                                _saving = false;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StatusScreen(
                                    emailMessage: emailIdError,
                                    passwordMessage: passwordError,
                                    actionMessage: actionError,
                                  ),
                                ),
                              );
                            }
                          }
                        },
                        textColor: Colors.black,
                        color: kWindowBackground,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 40,
                        ),
                        child: Text('Enter'),
                      ),
                    ],
                  ),
                  // Instructions
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 10,
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(thickness: 1, color: Colors.grey.shade500),

                          TypewriterAnimatedTextKit(
                            speed: Duration(seconds: 1),
                            totalRepeatCount: 5,
                            text: [
                              'Help',
                            ],
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(color: kTextWhite),
                          ),
                          SizedBox(height: 10),
                          // Instruction 1
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '1). To log in write: ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextSpan(
                                  text: 'CP:\\login ',
                                  style: TextStyle(
                                    color: kTextGreen,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          // Instruction 2
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '2). To create account write ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextSpan(
                                  text: 'CP:\\create',
                                  style: TextStyle(
                                    color: kTextGreen,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _createAccount() async {
    final status = await FirebaseAuthHelper()
        .createAccount(email: emailId, pass: password);
    if (status == AuthResultStatus.successful) {
      setState(() {
        _saving = false;
      });
      _firestore.collection('users').add({'email': emailId});
      Navigator.pushNamed(context, ContactScreen.id);
    } else {
      final errorMsg = AuthExceptionHandler.generateExceptionMessage(status);
      setState(() {
        _saving = false;
      });
      _showAlertDialog(errorMsg);
    }
  }

  _login() async {
    {
      final status =
          await FirebaseAuthHelper().login(email: emailId, pass: password);

      if (status == AuthResultStatus.successful) {
        setState(() {
          _saving = false;
        });
        Navigator.pushNamed(context, ContactScreen.id);
      } else {
        final errorMsg =
            await AuthExceptionHandler.generateExceptionMessage(status);
        setState(() {
          _saving = false;
        });
        _showAlertDialog(errorMsg);
      }
    }
  }

  _showAlertDialog(errorMsg) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Login Failed',
            style: TextStyle(color: Colors.black),
          ),
          content: Text(errorMsg),
        );
      },
    );
  }
}
