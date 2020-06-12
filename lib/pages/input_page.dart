import 'package:bmi_calculator/components/custom_full_width_button.dart';
import 'package:bmi_calculator/pages/result.dart';
import 'package:bmi_calculator/services/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components//custom_card.dart';
import 'package:bmi_calculator/components/content_card.dart';
import 'package:bmi_calculator/components/counter_button.dart';
import 'package:bmi_calculator/config/constants.dart';

import 'result.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double currentInputHeight = 140.0;
  int currentInputWeight = 40;
  int currentInputAge = 17;

  Color maleCardColor = kInActiveCardColor;
  Color femaleCardColor = kInActiveCardColor;

  Gender selectedGender;

  void setGender(Gender selectedGender) {
    setState(() {
      if (selectedGender == Gender.male) {
        maleCardColor = maleCardColor == kActiveCardColor
            ? kInActiveCardColor
            : kActiveCardColor;
        femaleCardColor = kInActiveCardColor;
      } else if (selectedGender == Gender.female) {
        femaleCardColor = femaleCardColor == kActiveCardColor
            ? kInActiveCardColor
            : kActiveCardColor;
        maleCardColor = kInActiveCardColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                CustomCard.withExpanded(
                  color: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInActiveCardColor,
                  child: ContentCard.genderCard(
                    icon: FontAwesomeIcons.mars,
                    gender: 'Male',
                  ),
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                    //setGender(Gender.male);
                  },
                ),
                CustomCard.withExpanded(
                  color: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInActiveCardColor,
                  child: ContentCard.genderCard(
                    icon: FontAwesomeIcons.venus,
                    gender: 'Female',
                  ),
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                    //setGender(Gender.female);
                  },
                ),
              ],
            ),
          ),
          CustomCard.withExpanded(
            color: kActiveCardColor,
            child: ContentCard.inputCard(
              label: 'HEIGHT',
              content: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      currentInputHeight.toInt().toString(),
                      style: kInputLabelTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    thumbColor: sliderTrackColor,
                    activeTrackColor: Colors.white,
                    overlayColor: sliderTrackColor.withOpacity(0.1),
                    inactiveTrackColor: Color(0xFF8D8E98),
                  ),
                  child: Slider(
                    value: currentInputHeight,
                    min: 0.0,
                    max: 360.0,
                    onChanged: (double inputHeight) {
                      setState(() {
                        currentInputHeight = inputHeight;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                CustomCard.withExpanded(
                  color: kActiveCardColor,
                  child: ContentCard.inputCard(
                    label: 'WEIGHT',
                    content: <Widget>[
                      Text(
                        currentInputWeight.toString(),
                        style: kInputLabelTextStyle,
                      ),
                      CounterButton(
                        value: currentInputWeight,
                        onChange: (int updateWeight) {
                          setState(() {
                            currentInputWeight = updateWeight;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                CustomCard.withExpanded(
                  color: kActiveCardColor,
                  child: ContentCard.inputCard(
                    label: 'AGE',
                    content: <Widget>[
                      Text(
                        currentInputAge.toString(),
                        style: kInputLabelTextStyle,
                      ),
                      CounterButton(
                        value: currentInputAge,
                        onChange: (int updateAge) {
                          setState(() {
                            currentInputAge = updateAge;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomFullWidthButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(FontAwesomeIcons.solidListAlt),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onTap: () {
              CalculatorBrain bmiResult = CalculatorBrain(
                height: currentInputHeight.toInt(),
                weight: currentInputWeight,
              );

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ResultPage(
                    bmiResult: bmiResult.calculate(),
                    status: bmiResult.getResult()['status'],
                    interpretation: bmiResult.getResult()['interpretation'],
                  );
                }),
              );
            },
          )
        ],
      ),
    );
  }
}

enum Gender {
  male,
  female,
}
