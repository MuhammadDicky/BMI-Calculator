import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({
    this.height,
    this.weight,
  });

  final int height;
  final int weight;

  double _bmi;

  String calculate() {
    _bmi = weight / pow(height / 100, 2);

    return _bmi.toStringAsFixed(1);
  }

  Map<String, String> getResult() {
    if (_bmi >= 25) {
      return {
        'status': 'Overweight',
        'interpretation':
            'You have a higher than normal body weight. Try to exercise more.',
      };
    } else if (_bmi > 18.5) {
      return {
        'status': 'Normal',
        'interpretation': 'You have normal body weight. Good job!.',
      };
    } else {
      return {
        'status': 'Underweight',
        'interpretation':
            'You have a lower than normal body weight. You can eat a bit more.',
      };
    }
  }
}
