import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.table_number, required this.starting_limit, required this.ending_limit });

  final int table_number;
  final int starting_limit;
  final int ending_limit;

  double _bmi=0.0;

  String calculateBMI() {

    _bmi = (table_number* starting_limit) as double;
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
