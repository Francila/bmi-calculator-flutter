import 'package:flutter/material.dart';
import 'constants.dart';

class CardContend extends StatelessWidget {
  final IconData iconImage;
  final String iconText;

  CardContend({this.iconImage, this.iconText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconImage,
          size: 70.0,
        ),
        SizedBox(height: 15.0),
        Text(
          iconText,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
