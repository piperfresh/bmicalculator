import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({required this.height,required this.weight,});
  final double height;
  final double weight;

  double? _bmi;

  String calculateBmi(){
    _bmi = weight/(pow(height/100, 2));
    return _bmi!.toStringAsFixed(1);
  }

  String getInterpretation() {
    if (_bmi! >= 25) {
      return 'You have a higher than normal body weight.';
    } else if (_bmi! >= 18.5) {
      return 'You have a great body. Good job!';
    } else {
      return 'You have a lower than normal body weight.';
    }
  }
}