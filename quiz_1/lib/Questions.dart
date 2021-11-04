import 'dart:math';

class Question {
  var rng = new Random();
  static int _q1 = 0;
 static int _q2 = 0;
  static int sum=0;
  late bool a;
  bool opt()
  {
    return a;
  }
  String ques1()
  {
    _q1 = rng.nextInt(10);

    return "First Number: $_q1";
  }
  String ques2()
  {

    _q2 = rng.nextInt(10);
    return "Second Number: $_q2";
  }
String quess()
{
  sum = _q1+_q2;
  return "sum :  $sum";
}

}