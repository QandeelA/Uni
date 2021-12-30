import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:lab_final_task/part1.dart';
import 'package:lab_final_task/password.dart';
import 'package:lab_final_task/uploadPass.dart';

import 'RetrievePassword.dart';
import 'SplashScreen.dart';

final FirebaseDatabase database = FirebaseDatabase.instance;

class MyApp extends StatelessWidget {

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
                        .pushReplacement(MaterialPageRoute(builder: (context) => Retrieve()));
                          // Update the state of the app.
                          // ...
                        },
                      ),
                      ListTile(
                        title: const Text('Upload Password'),

                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (context) => uploadpass()));
                          // Update the state of the app.
                          // ...
                        },
                      ),

                    ]
                ),
              ),
            ),
            backgroundColor: Colors.cyan,
            body: MyHomePage(),
        )
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var increment;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 3,
            child: Container(
             decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("Images/0_C-cPP9D2MIyeexAT.gif"),
        fit: BoxFit.cover,

      )

    ),
            ),
          ),

        ],
      ),
    );
  }

}