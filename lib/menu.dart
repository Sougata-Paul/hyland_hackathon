import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyland_hackathon/authentication/authentication_service.dart';
import 'package:hyland_hackathon/chat/chatrooms.dart';
import 'package:hyland_hackathon/contactlist.dart';
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
  int index = 0;
  List pages = [
    new DiseaseChecker(),
    new orders(),
    new Chatrooms(),
    new feed(),
    new contactlist(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.lightBlue.shade300.withOpacity(0.75),
        fixedColor: Colors.white,
        currentIndex: index,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: 'Orders', icon: Icon(Icons.shopping_bag_rounded)),
          BottomNavigationBarItem(label: 'Chat', icon: Icon(Icons.chat_bubble)),
          BottomNavigationBarItem(
              label: 'Feed', icon: Icon(Icons.connect_without_contact)),
          BottomNavigationBarItem(
            label: 'Contact',
            icon: Icon(
              Icons.language,
            ),
          ),
        ],
        onTap: (val) {
          setState(() {
            index = val;
          });
        },
      ),
      body: pages[index],
    );
  }
}
