import 'dart:collection';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab_final_task/part1.dart';
import 'package:lab_final_task/password.dart';

import 'SplashScreen.dart';
import 'main.dart';

final FirebaseDatabase database = FirebaseDatabase.instance;
class uploadpass extends StatelessWidget {
  const uploadpass({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: Scaffold(
      appBar: AppBar(
      centerTitle: true,
      backgroundColor:Colors.black26,
      title: Text('Random Password Generating App'),

    ),
    drawer: Drawer(

    child: Container(
    color: Colors.black12,
    child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
    const DrawerHeader(
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("Images/how-to-use-a-random-password-generator_tvjd.jpg"),
    fit: BoxFit.cover,
    )
    ), child: null,
    ),
    ListTile(
    title: const Text('SplashScreen'),
    onTap: () {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => SplashScreen())); // Update the state of the app.
    // ...
    },
    ),
      ListTile(
        title: const Text('Home'),

        onTap: () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => MyApp()));
          // Update the state of the app.
          // ...
        },
      ),
    ListTile(
    title: const Text('Simple'),

    onTap: () {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => GeneratePassword()));
    // Update the state of the app.
    // ...
    },
    ),
    ListTile(
    title: const Text('Hard'),

    onTap: () {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => MyApps()));
    // Update the state of the app.
    // ...
    },
    ),
    ListTile(
    title: const Text('Retrieve Password'),

    onTap: () {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => MyApps()));
    // Update the state of the app.
    // ...
    },
    ),


    ]
    ),
    ),
    ),
    backgroundColor: Colors.cyan,
    body: uploadpassState(),
    ),
    );
  }
}

class uploadpassState extends StatefulWidget {
  const uploadpassState({Key key}) : super(key: key);

  @override
  _uploadpassStateState createState() => _uploadpassStateState();
}

class _uploadpassStateState extends State<uploadpassState> {
  String pass;
  String key;
  DataSnapshot snapshot;
  int x =1;
  void uploadd(String passw)
  {
   database.reference().child("Passwords $x").set(
       {"Pass": "$passw", "index": "$x"}
   );
   setState(() {
   });
  }
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      TextField(
        controller: _controller,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.cyan,),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.cyan),
            ),
            suffixIcon: IconButton(
                onPressed: (){
                  final data = ClipboardData(text: _controller.text);
                  Clipboard.setData(data);

                  final snackbar = SnackBar(
                      content: Text("Password Copy"));

                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(snackbar);
                },
                icon: Icon(Icons.copy))
        ),
      ),
      SizedBox(height: 15,),
      ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black
              ),
              onPressed: (){
                pass =_controller.text;
                uploadd(pass);
                x++;
              },
              child: Text("Upload Password ",style: TextStyle(color: Colors.white),)
          ),
      ]
      ),
    ),);
  }
}
