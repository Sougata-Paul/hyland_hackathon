import 'package:flutter/material.dart';
import 'package:hyland_hackathon/disease_checker.dart';
import 'package:hyland_hackathon/feed.dart';

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
                      context,
                      MaterialPageRoute(
                          builder: (context) => feed()));
                },
                child: Text(
                  'feed',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      letterSpacing: MediaQuery.of(context).size.width * 0.002),
                )),
          ],
        )),
      ),
    );
  }
}
