import 'package:chatpadapp/constants.dart';
import 'package:chatpadapp/model/firebase_auth_helper.dart';
import 'package:chatpadapp/screen/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_Screen';

  final String connectionEmailId;
  ChatScreen({this.connectionEmailId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  List<UsersListWidget> usersWidgets = [];
  String connectionEmail;

  TextEditingController controllerType;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    usersStream();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void usersStream() async {
    await for (var snapshot in _firestore.collection('users').snapshots()) {
      for (var usersSnapshot in snapshot.documents) {
        print(usersSnapshot.data.values);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kWindowBackground,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.red.shade900,
              size: 25,
            ),
          ),
          title: Text(
            'ChatPad',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ));
                }
                final usersSnapshot = snapshot.data.documents;

                int userCount = 0;
                for (var user in usersSnapshot) {
                  userCount++;
                  final userEmail = user.data['email'];

                  final userWidget =
                      UsersListWidget(count: userCount, userEmailId: userEmail);
                  usersWidgets.add(userWidget);
                }
                return Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    children: usersWidgets,
                  ),
                );
              },
            ),
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  Divider(
                    thickness: 1,
                    color: kTextGreen,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'CP:\\open ',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Stardos',
                            fontSize: 20,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            autofocus: true,
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.phone,
                            controller: controllerType,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Stardos',
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '1',
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade600,
                                fontFamily: 'Stardos',
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 2),
                            ),
                            onChanged: (newText) {
                              controllerType =
                                  TextEditingController(text: newText);
                            },
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            int index;
                            try {
                              index = int.parse(controllerType.text);
                              connectionEmail =
                                  usersWidgets.elementAt(index - 1).userEmailId;

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                      connectionEmailId: connectionEmail),
                                ),
                              );
                            } catch (e) {
                              print(e);
                            }
                          },
                          textColor: Colors.black,
                          color: kWindowBackground,
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 30,
                          ),
                          child: Text(
                            'Connect',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UsersListWidget extends StatelessWidget {
  final String userEmailId;
  final int count;
  UsersListWidget({this.count, this.userEmailId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Material(
        color: Colors.black,
        elevation: 5,
        shadowColor: Colors.grey.shade500,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              Text(
                '$count). ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'TypeWriter'),
              ),
              Text(
                userEmailId,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: 'TypeWriter',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
