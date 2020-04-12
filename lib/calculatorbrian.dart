import 'dart:math';

class CalculatorBrain{
  final int height;
  final int weight;

  CalculatorBrain({this.height, this.weight});

  double _bmi;

  String calculateBMI(){
   _bmi= weight/pow(height/100, 2);

    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=21){
      return "Overweight";
    }
    else if(_bmi>18){
      return "Normal";
    }
    else{
      return "Underweight";
    }
  }

  String getInterpretation(){
    if(_bmi>=21){
      return "You have a higher then normal body weight. Try to exercise more.";
    }
    else if(_bmi>18){
      return "You have Normal body weight. Good Job!";
    }
    else{
      return "You have a lower then normal body weight. You can eat a bit more.";
    }
  }
}