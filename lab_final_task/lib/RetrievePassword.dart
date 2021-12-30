import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_final_task/part1.dart';
import 'package:lab_final_task/password.dart';
import 'package:lab_final_task/uploadPass.dart';

import 'SplashScreen.dart';
import 'main.dart';

class Retrieve extends StatelessWidget {
  const Retrieve({Key key}) : super(key: key);

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
          body: RetrievePage(),
        )
    );
  }
}

class RetrievePage extends StatefulWidget {
  const RetrievePage({Key key}) : super(key: key);

  @override
  _RetrievePageState createState() => _RetrievePageState();
}

class _RetrievePageState extends State<RetrievePage> {
   final dref = FirebaseDatabase.instance.reference();
   DatabaseReference databaseReference;
   setData(){
     dref.child("Password").set(
       {
       'id': '01',
       }
     );
   }
   showData()
   {
     dref.once().then((snapshot)
         {
           print(snapshot.toString());
         });
   }
   @override
   void initState(){
     super.initState();
     databaseReference = dref;
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ElevatedButton(
            onPressed: showData,
            child: Text(
              'Show Data',
              style: TextStyle(
                fontSize: 20,
                color: Colors.teal,
              ),
            ),
          ),
        ),

      ),
    );
  }
}

