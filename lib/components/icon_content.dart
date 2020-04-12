import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';


class CardChild extends StatelessWidget {
  final Icon gender;
  final String genderName;


  CardChild(this.gender, this.genderName);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        gender,
        SizedBox(
          height: 15,
        ),
        Text(
          genderName,
          style:
         kLabelTextStyle,
        )
      ],
    );
  }
}
