import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_1/Questions.dart';
import 'package:quiz_1/Questionss.dart';
import 'package:quiz_1/SplashScreen.dart';


Question q = new Question();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        splashColor: Colors.red,
        highlightColor: Colors.black.withOpacity(.5),
      ),

      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:Colors.teal,
          title: Text('Simple Kids Math App'),

        ),
        drawer: Drawer(

          child: Container(
            color: Colors.tealAccent,

            child: ListView(
              // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("Assests/ludo.jpg"),
                            fit: BoxFit.cover
                        )
                    ), child: null,
                  ),
                  ListTile(
                    title: const Text('1 to 5 Options'),
                    onTap: () {
                      q.a = false;
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => MyApp())); // Update the state of the app.
                      // ...
                    },
                  ),
                  Theme(
                    data: ThemeData(
                      splashColor: Colors.red,
                      highlightColor: Colors.black.withOpacity(.5),
                    ),
                    child: ListTile(
                      title: const Text('1 to 10 Options'),

                      onTap: () {
                        q.a = true;
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => MyApp()));
                        // Update the state of the app.
                        // ...
                      },
                    ),
                  ),
                ]
            ),
          ),
        ),
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: MyHomePage(),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 1,),
            const Text(
              'Welcome to Simple Math App for Kids',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            Spacer(flex: 1,),
            Expanded(
              child: Center(
                child: Text(
                  q.ques1(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Spacer(flex: 1,),
            Expanded(
              child: Center(
                child: Text(
                  q.ques2(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Spacer(flex: 1,),


            Expanded(
              child: Center(
                child: FlatButton(
                  color: Colors.red,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {

                    Expanded(
                      child: Center(
                        child: Text(
                          q.quess(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                    Spacer(flex: 1,);

                    //The user picked false.
                  },
                ),


              ),

            ),


          ],
        ),
            ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
