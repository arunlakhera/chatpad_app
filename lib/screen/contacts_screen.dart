import 'package:chatpadapp/constants.dart';
import 'package:chatpadapp/screen/chat_screen.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  static const String id = 'contacts';
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kWindowBackground,
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.red.shade900,
              size: 25,
            ),
          ),
          title: Text(
            'Contacts',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Stack(
          children: [
            ListView(
              scrollDirection: Axis.vertical,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(15),
                  leading: Text(
                    '1',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Stardos'),
                  ),
                  title: Text(
                    'Jane Doe 1',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Stardos'),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 30,
                  ),
                ),
                Divider(thickness: 2, color: Colors.grey.shade500),
                ListTile(
                  contentPadding: EdgeInsets.all(15),
                  leading: Text(
                    '2',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Stardos'),
                  ),
                  title: Text(
                    'Jane Doe 2',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Stardos'),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 30,
                  ),
                ),
                Divider(thickness: 2, color: Colors.grey.shade500),
                ListTile(
                  contentPadding: EdgeInsets.all(15),
                  leading: Text(
                    '1',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Stardos'),
                  ),
                  title: Text(
                    'Jane Doe 1',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Stardos'),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 30,
                  ),
                ),
                Divider(thickness: 2, color: Colors.grey.shade500),
                ListTile(
                  contentPadding: EdgeInsets.all(15),
                  leading: Text(
                    '2',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Stardos'),
                  ),
                  title: Text(
                    'Jane Doe 2',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Stardos'),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 30,
                  ),
                ),
                Divider(thickness: 2, color: Colors.grey.shade500),
                ListTile(
                  contentPadding: EdgeInsets.all(15),
                  leading: Text(
                    '1',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Stardos'),
                  ),
                  title: Text(
                    'Jane Doe 1',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Stardos'),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 30,
                  ),
                ),
                Divider(thickness: 2, color: Colors.grey.shade500),
                ListTile(
                  contentPadding: EdgeInsets.all(15),
                  leading: Text(
                    '2',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Stardos'),
                  ),
                  title: Text(
                    'Jane Doe 2',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Stardos'),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 30,
                  ),
                ),
                Divider(thickness: 2, color: Colors.grey.shade500),
                ListTile(
                  contentPadding: EdgeInsets.all(15),
                  leading: Text(
                    '1',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Stardos'),
                  ),
                  title: Text(
                    'Jane Doe 1',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Stardos'),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 30,
                  ),
                ),
                Divider(thickness: 2, color: Colors.grey.shade500),
                ListTile(
                  contentPadding: EdgeInsets.all(15),
                  leading: Text(
                    '2',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Stardos'),
                  ),
                  title: Text(
                    'Jane Doe 2',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Stardos'),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 30,
                  ),
                ),
                Divider(thickness: 2, color: Colors.grey.shade500),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
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
                              //controller: controllerType,
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
                                //controllerType =TextEditingController(text: newText);
                              },
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                Navigator.pushNamed(context, ChatScreen.id);
                              });
                            },
                            textColor: Colors.black,
                            color: kWindowBackground,
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 30,
                            ),
                            child: Text(
                              'Enter',
                              style: TextStyle(fontSize: 15),
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
    );
  }
}
