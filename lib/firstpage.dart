import 'package:flutter/material.dart';
import 'package:hyland_hackathon/authentication/signup.dart';


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            ),
            SizedBox(
              height: 300,
              width: 300,
            ),
            Text('Welcome To Patients Recovery Application',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 40)),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue.shade900),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: Colors.white)))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => signup()));
                },
                child: Text('Get Started',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height/50,
                        letterSpacing:
                            MediaQuery.of(context).size.height/500))),
          ],
        ),
      ),
    );
  }
}
