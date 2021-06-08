import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyland_hackathon/authentication/authentication_service.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email,password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log in"),
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.all(11.0),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            cursorColor: Colors.black,
            style:
                TextStyle(color: Colors.black, fontFamily: 'Andika New Basic'),
            onChanged: (value) {
              setState(() {
                email=value;
              });
            },
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.black,
                )),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                labelText: 'Email',
                labelStyle: GoogleFonts.roboto(
                  fontSize: MediaQuery.of(context).size.width / 20,
                  color: Colors.black,
                ),
                errorStyle: TextStyle(
                  color: Colors.black,
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(11.0),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            cursorColor: Colors.black,
            style:
                TextStyle(color: Colors.black, fontFamily: 'Andika New Basic'),
            onChanged: (value) {
              setState(() {
                password=value;
              });
            },
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.black,
                )),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                labelText: 'Password',
                labelStyle: GoogleFonts.roboto(
                  fontSize: MediaQuery.of(context).size.width / 20,
                  color: Colors.black,
                ),
                errorStyle: TextStyle(
                  color: Colors.black,
                )),
          ),
        ),
         Container(
                  height: MediaQuery.of(context).size.height/15,
              width: MediaQuery.of(context).size.width / 2,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue.shade900),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.08),
                                side: BorderSide(color: Colors.white)))),
                      onPressed: () async {
                        EasyLoading.show(status: 'Authenticating...');
                        try {
                          print(email);
                          print(password);
                          await login(email,password);
                          // if (user != null) {
                          //   Navigator.pop(context);
                          //   Navigator.pushReplacement(context,
                          //       MaterialPageRoute(builder: (context) => Menu()));
                          //   EasyLoading.showSuccess('Logged in successfully');
                          // }
                          EasyLoading.dismiss();
                        } catch (e) {
                          EasyLoading.showError(
                            e.message,
                          );
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.05,letterSpacing: MediaQuery.of(context).size.width*0.002),
                      )),
                ),
      ]),
    );
  }
}
