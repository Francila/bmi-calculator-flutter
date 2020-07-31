class CalculatorBrain {
  int height;
  int weight;
  double _bmi;

  CalculatorBrain(this.height, this.weight) {
    double nHeight = height / 100;
    _bmi = weight / (nHeight * nHeight);
  }

  String calcBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String resultBMI() {
    if (_bmi > 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String interpretationBMI() {
    if (_bmi > 25) {
      return 'Your BMI is high. Improve your exercises.';
    } else if (_bmi > 18) {
      return 'Your BMI is good. Keep going.';
    } else {
      return 'Your BMI is low. Eat a Burger King.';
    }
  }
}
