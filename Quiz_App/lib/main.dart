import 'dart:async';
import 'package:class05_quiz_aap/Contact_US.dart';
import 'package:class05_quiz_aap/Result.dart';
import 'package:flutter/material.dart';
import 'quiz_brain.dart';


QuizBrain quizBrain = QuizBrain();

class QuizApp extends StatelessWidget {
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
          title: Text('Quiz App'),

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
                ), child: null,
              ),
              ListTile(
                title: const Text('Result'),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) => Result())); // Update the state of the app.
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
                      .pushReplacement(MaterialPageRoute(builder: (context) => ContactUs()));
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
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  static List<Icon> scoreKeeper = [];
  static int c = 0, f = 0, s= 0 ,t=0;
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {


  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        quizBrain.reset();
        QuizPage.scoreKeeper = [];
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Result()));
        QuizPage.t++; //Send to API
      } else {
        if (userPickedAnswer == correctAnswer) {
          QuizPage.scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          QuizPage.c++;
          QuizPage.t++;
        } else if (userPickedAnswer != correctAnswer) {
          QuizPage.scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          QuizPage.f++;
          QuizPage.t++;
        }
        else {
          QuizPage.s++;
          QuizPage.t++;
        }
        quizBrain.nextQuestion();
      }
    });
  }



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
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  checkAnswer(true);
                  //The user picked true.
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  checkAnswer(false);
                  //The user picked false.
                },
              ),
            ),
          ),
          Row(
            children: QuizPage.scoreKeeper,
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

/*void _startTimer() {
  QuizPage._counter = 10;
  QuizPage._counter = 10;
  if (QuizPage._timer != null) {
    QuizPage._timer.cancel();
  }
  QuizPage._timer = Timer.periodic(Duration(seconds: 1), (timer) {
    if (QuizPage._counter > 0) {
      QuizPage._counter--;
    } else {
      QuizPage._timer.cancel();
    };
  });
}*/
/* (QuizPage._counter > 0) ? Text("") : quizBrain.getQuestionText(),
          Text(

            '$QuizPage.x',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          ElevatedButton(onPressed: () => _startTimer,
            child: Text("Start"),),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),),),*/