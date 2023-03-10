import 'package:flutter/material.dart';
import 'package:puzzles/utils/customtextfield.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  final TextEditingController _seacrhtext = TextEditingController();

  bool isactive1 = true;
  bool isactive2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFFFFFED),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(

          child: Padding(
            padding: EdgeInsets.fromLTRB(35,MediaQuery.of(context).size.height * 0.07,20,0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                const Text("Hello User",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,),
                const Text("Let's Play Some Music !",),
                const SizedBox(
                  height: 40,
                ),
                const Text("Moods",
                style:TextStyle(
                    fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),),
                Container(
                  height: 100,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    children: <Widget>[
                      Container(
                        height: 75,
                        width: 100,
                        color: Colors.amber[600],
                        child: const Center(child: Text('Entry A')),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 75,
                        width: 100,
                        color: Colors.amber[600],
                        child: const Center(child: Text('Entry B')),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 75,
                        width: 100,
                        color: Colors.amber[600],
                        child: const Center(child: Text('Entry C')),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 75,
                        width: 100,
                        color: Colors.amber[600],
                        child: const Center(child: Text('Entry D')),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 75,
                        width: 100,
                        color: Colors.amber[600],
                        child: const Center(child: Text('Entry E')),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 75,
                        width: 100,
                        color: Colors.amber[600],
                        child: const Center(child: Text('Entry F')),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                customTextField("Type here",Icons.search,true, _seacrhtext),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: 150,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:  MaterialStateProperty.all<Color>(Colors.orange),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.search,color: Colors.white,),
                          SizedBox(width: 8.0),
                          Text('Search',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                const Text("Recommend By",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),),

                SizedBox(
                  height: 22.5,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isactive1 = true;
                              isactive2 = false;
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor:  MaterialStateProperty.all<Color>(isactive1 ? Colors.orange : Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.emoji_emotions_rounded,color: isactive1 ? Colors.white : Colors.black,),
                              const SizedBox(width: 8.0),
                              Text('Emotions',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isactive1 ? Colors.white : Colors.black,
                                ),),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 20,
                      ),

                      SizedBox(
                        width: 150,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isactive1 = false;
                              isactive2 = true;
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor:  MaterialStateProperty.all<Color>(isactive2 ? Colors.orange: Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.music_note_sharp,color: isactive2 ? Colors.white : Colors.black,),
                              const SizedBox(width: 8.0),
                              Text('Music',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isactive2 ? Colors.white : Colors.black,
                                ),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
