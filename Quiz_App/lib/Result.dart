import 'package:class05_quiz_aap/Contact_US.dart';
import 'package:class05_quiz_aap/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:Colors.teal,
          title: Text('Result Page'),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.tealAccent,
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("Images/pic.jpg"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  ListTile(
                    title: const Text('Home'),
                    onTap: () {
                       Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) => QuizApp()));
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                      title: const Text('Contact Us'),

                      onTap: () {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => ContactUs()));
                        // Update the state of the app.
                        // ...
                      },
                    ),

                ]
            ),
          ),
        ),
        backgroundColor: Colors.tealAccent,

        body:Stack(
            fit: StackFit.expand,
            children: [
        Column(
          children: <Widget> [
    Expanded(
    child: Padding(
    padding: EdgeInsets.all(15.0),
    child: FlatButton(
    textColor: Colors.white,
    color: Colors.green,
    child: Text(
    'Start',
    style: TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    ),
    ),
    onPressed: (){
      QuizPage.t=0;
      QuizPage.c=0;
      QuizPage.f=0;
      QuizPage.s=0;


    },
    ),
    ),
    ),
            Spacer(flex: 1),
            Text(
              "Score",
              style: Theme.of(context)
                  .textTheme
                  .headline3,
            ),
            Spacer(),
            Text(
              "Total score obtained: ${QuizPage.c * 10}/${(QuizPage.t-1)*10}",
              style: Theme.of(context)
                  .textTheme
                  .headline4
            ),
            Spacer(flex: 1),
            Text(
                "Incorrect answers: ${QuizPage.f }",
                style: Theme.of(context)
                    .textTheme
                    .headline4
            ),
            Spacer(flex: 1),
            Text(
                "Correct answers: ${QuizPage.c }",
                style: Theme.of(context)
                    .textTheme
                    .headline4
            ),
            Spacer(flex: 1),
            Text(
                "Missed/Skipped answers: ${QuizPage.s}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
            ),
            Spacer(flex: 1),
          ],

        )
   ], ),
        );

  }
}