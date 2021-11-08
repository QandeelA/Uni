import 'package:flutter/material.dart';

import 'main.dart';


class HomePage extends StatelessWidget {
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
          backgroundColor:Colors.black26,
          title: Text('Quiz App'),

        ),
        drawer: Drawer(

          child: Container(
            color: Colors.cyan,
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
                          fit: BoxFit.cover,
                        )
                    ), child: null,
                  ),
                  ListTile(
                    title: const Text('Result'),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => QuizApp())); // Update the state of the app.
                      // ...
                    },
                  ),
                  Theme(
                    data: ThemeData(
                      splashColor: Colors.red,
                      highlightColor: Colors.black.withOpacity(.5),
                    ),
                    child: ListTile(
                      title: const Text('Contact Us'),

                      onTap: () {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => QuizApp()));
                        // Update the state of the app.
                        // ...
                      },
                    ),
                  ),
                ]
            ),
          ),
        ),
        backgroundColor: Colors.cyan,
        body: SafeArea(


          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: HomePages(),
          ),
        ),
      ),
    );
  }
}

class HomePages extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePages> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(

              child: Text(
               ' Welcome to Kids simple Math Quiz App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),


      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
