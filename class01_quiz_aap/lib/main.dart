import 'dart:async';
import 'Contact_US.dart';
import 'Home.dart';
import 'Result.dart';
import 'quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/services.dart';

QuizBrain quizBrain = QuizBrain();
 int o;
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
                    title: const Text('Options 1 to 5'),
                    onTap: () {
                      o =1;
                      QuizPage.t=5;
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => QuizApp())); // Update the state of the app.
                      // ...
                    },
                  ),
      ListTile(
        title: const Text('Options 1 to 10'),

        onTap: () {
          o=2;
          QuizPage.t=10;
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => QuizApp()));
          // Update the state of the app.
          // ...
        },
      ),
      ListTile(
        title: const Text('Results'),

        onTap: () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => Result()));
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

  static int c=0, f=0, s=0, t=0, x=0,o=0;
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  TextEditingController _value = TextEditingController();
  int _counter = 10;
  Timer _timer;
  int z = 0;
  var value;

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
          quizBrain.nextQuestion();
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
  void checkAnswer(bool ans) {
    var correctAnswer = quizBrain.q1+ quizBrain.q2 ;
    setState(() {
        //Send to API
        if(ans == true)
          {
           if(correctAnswer == value)
             {
               QuizPage.c++;
             }
           else if(correctAnswer == value)
           {
             QuizPage.c++;
           }
           else if(correctAnswer != value)
             {
               QuizPage.f++;
             }
           else
             QuizPage.s++;
          }
        print("Answer is: $correctAnswer" );
       if (quizBrain.isFinished() == true) {
          quizBrain.reset();
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => Result()));
          QuizPage.t++; //Send to API
        }
        quizBrain.nextQuestion();
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
            controller: _value,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Enter your answer here!",
            ),
            inputFormatters: <TextInputFormatter> [
             FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
          ),
          Spacer(flex: 2,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: ElevatedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  value = _value.text;

                  _startTimer();//The user picked true.
                  checkAnswer(true);
                  },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),

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
