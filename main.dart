import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:puzzles/models/radio.dart';
import 'package:puzzles/screens/RadioPlayerHomeScreen.dart';
import 'package:puzzles/screens/bottomnavbar.dart';
import 'package:puzzles/screens/chat_screen.dart';
import 'screens/sigin_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/WelcomePage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Nav(),
    );
  }
}

