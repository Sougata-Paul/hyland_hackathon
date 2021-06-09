import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hyland_hackathon/firstpage.dart';
import 'package:hyland_hackathon/menu.dart';
import 'package:hyland_hackathon/authentication/authentication_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await loaduserdata();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: userDetails!=null ? Menu() : FirstPage(),
    );
  }
}
