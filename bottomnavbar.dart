import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'package:puzzles/screens/WelcomePage.dart';
import 'RadioPlayerHomeScreen.dart';
import 'package:puzzles/screens/search.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {

  int currindex = 0;
  final screens = [
    WelcomePage(),
    YoutubeScreen(),
    RadioHS(),
    ChatScreen(),
  ];


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: screens[currindex],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 15),
          child: GNav(
            selectedIndex: currindex,
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.orange,
            padding: EdgeInsets.all(14),
            gap: 12,
            onTabChange: (index){
               setState(() {
                 currindex = index;
               });
            },
            tabs: const [
            GButton(
                icon:Icons.home,
                text:'Home',
            ),
            GButton(
              icon:Icons.search,
              text:'Search',
            ),
            GButton(
              icon:Icons.radio,
              text:'Radio',
            ),
            GButton(
              icon:Icons.chat,
              text:'Assistant',
            ),
          ],
          ),
        ),
      ),
    );
  }
}
