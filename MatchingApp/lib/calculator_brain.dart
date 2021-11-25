import 'dart:math';
class CalculatorBrain {
  var rng = new Random();
  static int n1;
  static int n2;

  int firstnumber() {
    n1 = rng.nextInt(5);
    return n1;
  }
  int sec_number() {
    n2 = rng.nextInt(5);
    return n2;
  }

}