import 'package:flutter/material.dart';
import 'package:hyland_hackathon/authentication/authentication_service.dart';
import 'package:hyland_hackathon/chat/chatrooms.dart';
import 'package:hyland_hackathon/disease_checker.dart';
import 'package:hyland_hackathon/dialogs.dart';
import 'package:hyland_hackathon/feed.dart';
import 'package:hyland_hackathon/firstpage.dart';
import 'package:hyland_hackathon/orders.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(),
            Text(userDetails['first_name']+" "+userDetails['last_name']),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue.shade900),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.08),
                            side: BorderSide(color: Colors.white)))),
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DiseaseChecker()));
                },
                child: Text(
                  'Disease Checker',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      letterSpacing: MediaQuery.of(context).size.width * 0.002),
                )),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue.shade900),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.08),
                            side: BorderSide(color: Colors.white)))),
                onPressed: () async {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => feed()));
                },
                child: Text(
                  'feed',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      letterSpacing: MediaQuery.of(context).size.width * 0.002),
                )),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blue.shade900),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.08),
                          side: BorderSide(color: Colors.white)))),
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Chatrooms()));
              },
              child: Text(
                'chatrooms',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    letterSpacing: MediaQuery.of(context).size.width * 0.002),
              ),
            ),
                        ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blue.shade900),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.08),
                          side: BorderSide(color: Colors.white)))),
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => orders(),),);
              },
              child: Text(
                'My orders',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    letterSpacing: MediaQuery.of(context).size.width * 0.002),
              ),
            ),
            GestureDetector(
            //color: Colors.white,
            onTap: () async {
              final action = await dialogs.yesabortdialog(
                  context, 'Confirm', 'Are you sure?');
              if (action == DialogAction.yes) {
                await logout();
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstPage()));
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue.shade200,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height/25,
                vertical: MediaQuery.of(context).size.height/80,
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.logout),
                        SizedBox(
                          width: MediaQuery.of(context).size.height/45,
                        ),
                        Text(
                          'Log Out',
                          style: TextStyle(
                              letterSpacing: 1.0,
                              color: Colors.black87,
                              fontFamily: 'Andika New Basic',
                              fontSize:
                                  MediaQuery.of(context).size.height/35,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ],
        )),
      ),
    );
  }
}
