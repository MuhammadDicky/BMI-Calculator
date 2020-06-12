import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CounterButton extends StatefulWidget {
  CounterButton({
    @required this.value,
    @required this.onChange,
    this.counterValue,
  });

  final int value;
  final int counterValue;
  final ValueChanged<int> onChange;

  @override
  _CounterButtonState createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  void returnResult(Operator operator) {
    int value = widget.value;
    int counterValue = widget.counterValue;
    int finalDivision =
        counterValue is int && counterValue > 0 ? counterValue : 1;

    setState(() {
      if (operator == Operator.plus) {
        value = value + finalDivision;
      } else {
        value = value - finalDivision;
      }
    });

    widget.onChange(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RoundIconButton(
          icon: FontAwesomeIcons.minus,
          onTap: () {
            returnResult(Operator.minus);
          },
        ),
        SizedBox(
          width: 5.0,
        ),
        RoundIconButton(
          icon: FontAwesomeIcons.plus,
          onTap: () {
            returnResult(Operator.plus);
          },
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({
    @required this.icon,
    @required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 45.0,
        height: 45.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: onTap,
    );
  }
}

enum Operator {
  plus,
  minus,
}
