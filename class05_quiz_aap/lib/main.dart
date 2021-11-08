import 'dart:async';
import 'package:class05_quiz_aap/Home.dart';
import 'package:class05_quiz_aap/quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int scoreKeeper;
  int _counter = 10;
  Timer _timer;
  int z = 0;

  void _startTimer() {
    _counter = 10;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else if (_counter == 0) {
          _counter = 10;
        } else if (_counter == 9 && _counter == 0) {
          quizBrain.nextQuestion();
          _counter=10;
        }else if(quizBrain.endCheck() == 9)
          {
           if(quizBrain.isFinished() == true)
             {
               _showDialog();
               quizBrain.reset();
             }
          }
      });
    });
  }
  void checkAnswer(bool userPickedAnswer) {

    int correctAnswer = quizBrain.getCorrectAnswer();
    scoreKeeper = correctAnswer;
    setState(() {
      if (quizBrain.isFinished() == true) {
        _timer.cancel();
        _showDialog();
        quizBrain.reset();
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
        //Send to API
      } else {
        Text(
          '$correctAnswer',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            height: 10,

          ),
        );
        quizBrain.nextQuestion();
      }
    });
  }

  void _showDialog() {
    quizBrain.reset();
    Alert(
      context: context,
      title: 'Finshed',
      desc: 'You\'ve reached the end of the quiz.',
    ).show();

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
    void initState() {
      _startTimer();
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Spacer(),
          Expanded(child: Text(
            '\n CountDown: $_counter\n',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
          ),
          Spacer(flex: 1,),
          Expanded(
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
          Spacer(),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter your answer here!",
            ),
          ),
          Spacer(flex: 1,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  _startTimer();//The user picked true.
                  checkAnswer(true);

                },
              ),
            ),
          ),
          Spacer(flex: 2,),
          Row(

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
