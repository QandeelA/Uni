import 'dart:math';

import 'package:class05_quiz_aap/main.dart';

class QuizBrain {
  int _questionNumber = 0, q=10;
  var rng = new Random();
  int q1 =Random(4).nextInt(10);
  int q2=Random(5).nextInt(10);

  String getQuestionText() {
    String a ="$q1 + $q2 " ;
    return a;
  }
  void nextQuestion() {
     q1 =rng.nextInt(100);
     q2 =rng.nextInt(100);

    if (_questionNumber < q - 1) {
      _questionNumber++;
    }
  }
int endCheck()
{
  return _questionNumber;
}
  bool isFinished() {
    int y=20, n =15;
     if ( QuizPage.o == 1)
       {
         q=5;
         if (_questionNumber >= q - 1 ) {
           return true;
         } else {
           return false;
         }
       }
     else if(QuizPage.o == 2 )
       {
         q=10;
         if (_questionNumber >= q - 1 ) {
           return true;
         } else {
           return false;
         }
       }


  }

  void reset() {
    _questionNumber = 0;
  }
}

//  void nextQuestion() {
//    if (_questionNumber < _questionBank.length - 1) {
//      _questionNumber++;
//    }
//  }
//
//  String getQuestionText() {
//    return _questionBank[_questionNumber].questionText;
//  }
//
//  bool getCorrectAnswer() {
//    return _questionBank[_questionNumber].questionAnswer;
//  }

//TODO: Step 3 Part A - Create a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.

//TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

//TODO: Step 4 Part B - Create a reset() method here that sets the questionNumber back to 0.
//}
