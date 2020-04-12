import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';



class BottomButton extends StatelessWidget {

  final Function ontapp;
  final String Buttontitle;

  BottomButton({@required this.ontapp,this.Buttontitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapp,
      child: Container(
        child: Center(child: Text(Buttontitle,style: kLargeButtonTextStyle,)),
        color: kBottomContainerColor,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}