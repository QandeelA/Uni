
import 'package:flutter/material.dart';
import 'package:quiz_1/Questions.dart';
import 'package:quiz_1/main.dart';

MyHomePage a = new MyHomePage();
Question q = new Question();
class Questionss extends StatefulWidget {
  const Questionss({Key? key}) : super(key: key);
String qq ()
{
 String x= q.ques1();
  String y = q.ques2();
  String z = x+y;
  return z;
}
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Scaffold(
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
                            image: AssetImage("Assests/Images/q.jpeg"),
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
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  qq(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
/*
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
            ),*/

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
                  q.quess();
                   textAlign: TextAlign.center;
                   style: TextStyle(
                     fontSize: 20.0,
                   color: Colors.black,
                  );
    //The user picked false.

    },
    ),


                ),

            ),
                      ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    ), );
  }

  @override
  State<StatefulWidget> createState() {

    // TODO: implement createState
    throw UnimplementedError();
  }
}

