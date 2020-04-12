import 'package:bmicalculator/components/bottombutton.dart';
import 'package:bmicalculator/components/reusablecard.dart';
import 'package:bmicalculator/screens/inputpage.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:bmicalculator/calculatorbrian.dart';

class ResultsPage extends StatelessWidget {
  final String bmiresult;
  final String resultText;
  final String interpretation;


  ResultsPage({@required this.bmiresult,@required this.resultText,@required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI CALCULATOR",style: TextStyle(fontFamily:"Permanent Marker")),
        centerTitle: true,
        elevation: 0,
    ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      child: Text("Your Result",style:kTitleTextStyle),
                    ),
                  )
              ],
            ),
          ),

          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget>[
                  Text(resultText.toUpperCase(),style: kResultTextStyle,),

                  Text(bmiresult,style:kBmiTextStyle),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,0,10,0),
                    child: Text(interpretation,style: kBodyTextStyle,),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            ontapp: (){
              Navigator.pop(context,
                  MaterialPageRoute(
                    builder:(context)=> InputPage(),
                  )
              );}
            ,Buttontitle: "RE-CALCULATE",),
        ],
      ),
    );
  }
}
