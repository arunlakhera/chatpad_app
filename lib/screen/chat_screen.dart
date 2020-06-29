import 'package:chatpadapp/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;
String connEmailId;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_Screen';

  ChatScreen({String connectionEmailId}) {
    connEmailId = connectionEmailId;
  }

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;

  String connectionEmail;
  String messageText;

  TextEditingController messageTextController = TextEditingController();

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
            MessagesStream(),
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
                        Expanded(
                          child: TextField(
                            controller: messageTextController,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                            onChanged: (value) {
                              messageText = value;
                            },
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            messageTextController.clear();
                            _firestore.collection('messages').add(
                              {
                                'message': messageText,
                                'sender': loggedInUser.email,
                                'receiver': connectionEmail,
                              },
                            );
                          },
                          color: kWindowBackground,
                          child: Text(
                            'Send',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
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

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ));
        }
        final messages = snapshot.data.documents.reversed;
        List<MessageWidget> messageWidgets = [];
        for (var message in messages) {
          final messageText = message.data['message'];
          final messageSender = message.data['sender'];
          final messageReceiver = message.data['receiver'];
          print(messageReceiver);

          final currentUser = loggedInUser.email;
          final messageWidget = MessageWidget(
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender ? true : false,
          );
          messageWidgets.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}

class MessageWidget extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMe;

  MessageWidget({this.sender, this.text, this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
                color: Colors.grey, fontSize: 12, fontFamily: 'Stardos'),
          ),
          Material(
            borderRadius: BorderRadius.circular(30),
            elevation: 5,
            color: kWindowBackground,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                '$text',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
