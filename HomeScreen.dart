import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'sigin_screen.dart';
import 'signup_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("HomeScreen"),
          onPressed: (){

            FirebaseAuth.instance.signOut().then((value){
              print("Signed Out");
              Navigator.push(context,MaterialPageRoute(builder: (context)=> SigninScreen()));
            });

          },
        ),
      )
    );
  }
}
