import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'calculator_brain.dart';

class BMIResult extends StatelessWidget {
  final CalculatorBrain c;

  BMIResult(this.c);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Your Result',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
            ),
            textAlign: TextAlign.left,
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveColor,
              cardChild: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      c.resultBMI(),
                      style: TextStyle(
                          color: Color(0xFF24D878),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      c.calcBMI(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 90.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      c.interpretationBMI(),
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top: 10.0),
            height: kFootnoteHeight,
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => BMIResult(c)),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'RE - CALCULATE YOUR BMI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
