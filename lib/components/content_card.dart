import 'package:flutter/material.dart';
import 'package:bmi_calculator/config/constants.dart';

class ContentCard extends StatelessWidget {
  ContentCard({this.content});

  factory ContentCard.genderCard({
    Key key,
    @required IconData icon,
    @required String gender,
  }) = _GenderCard;

  factory ContentCard.inputCard({
    Key key,
    @required String label,
    List<Widget> content,
  }) = _InputCard;

  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: content,
    );
  }
}

class _GenderCard extends ContentCard {
  _GenderCard({
    Key key,
    IconData icon,
    String gender,
  }) : super(
          content: <Widget>[
            Icon(
              icon,
              size: 80.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              gender.toUpperCase(),
              style: kLabelTextStyle,
            ),
          ],
        );
}

class _InputCard extends ContentCard {
  _InputCard({
    Key key,
    String label,
    List<Widget> content,
  }) : super(
          content: <Widget>[
            Text(
              label.toUpperCase(),
              style: kLabelTextStyle,
            ),
            ...(content is List<Widget> ? content : []),
          ],
        );
}
