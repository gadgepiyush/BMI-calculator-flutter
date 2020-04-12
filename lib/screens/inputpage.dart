import 'package:bmicalculator/calculatorbrian.dart';
import 'package:bmicalculator/components/bottombutton.dart';
import 'package:bmicalculator/components/reusablecard.dart';
import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/screens/resultspage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/roundbutton.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR',style: TextStyle(fontFamily:"Permanent Marker"),),
          elevation: 0,
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                //the male card
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    colour: selectedGender == GenderType.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: CardChild(
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80,
                        ),
                        "MALE"),
                  ),
                ),

                //the female card
                Expanded(

                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    colour: selectedGender == GenderType.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: CardChild(
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80,
                        ),
                        "FEMALE"),
                  ),
                ),
              ],
            ),

            /*-----------------the slider card-------------*/
            Expanded(
              child:  ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("HEIGHT"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          "$height",
                          style: kNumberTextStyle,
                        ),
                        Text(
                          "cm",
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        inactiveTrackColor: Color(0xFFF8D8e98),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 250.0,
                        inactiveColor: Color(0xFFF8D8e98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),

            /*-----------------weight tile------------*/
            Row(
              children: <Widget>[
                Expanded(
                  child: new ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundActionButton(
                              childIcon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundActionButton(
                                childIcon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight += 1;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                /*-----------------age tile------------*/

                Expanded(
                  child: new ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundActionButton(
                              childIcon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundActionButton(
                                childIcon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age += 1;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            BottomButton(
              ontapp: () {
                CalculatorBrain calc =
                    new CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiresult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      ),
                    ));
              },
              Buttontitle: "CALCULATE",
            ),
          ],
        ));
  }
}
