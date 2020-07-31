import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_contend.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'bmi_result.dart';
import 'calculator_brain.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = kInactiveColor;
  Color femaleColor = kInactiveColor;
  int height = 180;
  int weight = 80;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      maleColor = kActiveColor;
                      femaleColor = kInactiveColor;
                    });
                  },
                  child: ReusableCard(
                    colour: maleColor,
                    cardChild: CardContend(
                      iconImage: FontAwesomeIcons.mars,
                      iconText: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      femaleColor = kActiveColor;
                      maleColor = kInactiveColor;
                    });
                  },
                  child: ReusableCard(
                    colour: femaleColor,
                    cardChild: CardContend(
                      iconImage: FontAwesomeIcons.venus,
                      iconText: 'FEMALE',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            colour: kActiveColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kLabelTitleStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: kActiveColor,
                  cardChild: buildColumn('WEIGHT'),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveColor,
                  cardChild: buildColumn('AGE'),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Color(0xFFEB1555),
          margin: EdgeInsets.only(top: 10.0),
          height: kFootnoteHeight,
          width: double.infinity,
          child: GestureDetector(
            onTap: () {
              CalculatorBrain c = CalculatorBrain(height, weight);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BMIResult(c)),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'CALCULATE YOUR BMI',
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
      ]),
    );
  }

  Column buildColumn(String label) {
    int dataToChange;
    if (label == 'WEIGHT') {
      dataToChange = weight;
    } else if (label == 'AGE') {
      dataToChange = age;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: kLabelTextStyle,
        ),
        Text(
          dataToChange.toString(),
          style: kLabelTitleStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: RoundIconButton(
                childIcon: Icon(Icons.add),
                onPressedBehaviour: () {
                  setState(() {
                    if (label == 'WEIGHT') {
                      weight++;
                    } else if (label == 'AGE') {
                      age++;
                    }
                  });
                },
              ),
            ),
            Expanded(
              child: RoundIconButton(
                childIcon: Icon(Icons.remove),
                onPressedBehaviour: () {
                  setState(() {
                    if (label == 'WEIGHT') {
                      weight--;
                    } else if (label == 'AGE') {
                      age--;
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final Widget childIcon;
  final Function onPressedBehaviour;
  RoundIconButton({this.childIcon, this.onPressedBehaviour});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      elevation: 0,
      disabledElevation: 0,
      splashColor: Color(0xFFEB1555),
      fillColor: Color(0xFF4C4F5E),
      child: childIcon,
      onPressed: onPressedBehaviour,
    );
  }
}
