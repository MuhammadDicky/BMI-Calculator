import 'package:bmi_calculator/config/constants.dart';
import 'package:bmi_calculator/components/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/custom_full_width_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    @required this.bmiResult,
    @required this.status,
    @required this.interpretation,
  });

  static const String routeName = '/resultPage';
  final String bmiResult, status, interpretation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: kContentPadding,
                top: kContentPadding,
              ),
              child: Text(
                'Your Result',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            CustomCard.withExpanded(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    status.toUpperCase(),
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 100.0,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(25.0),
                    child: Text(
                      interpretation,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            CustomFullWidthButton.materialButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(FontAwesomeIcons.arrowLeft),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'RE - CALCULATE',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPageArg {
  ResultPageArg({
    @required this.bmiResult,
    @required this.status,
    @required this.interpretation,
  });

  final String bmiResult, status, interpretation;
}
