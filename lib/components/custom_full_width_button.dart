import 'package:flutter/material.dart';
import 'package:bmi_calculator/config/constants.dart';

class CustomFullWidthButton extends StatelessWidget {
  const CustomFullWidthButton({
    Key key,
    this.child,
    @required this.onTap,
  }) : super(key: key);

  factory CustomFullWidthButton.materialButton({
    Key key,
    Widget child,
    GestureTapCallback onTap,
  }) = _MaterialButton;

  final Widget child;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: kButtonCalcColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kCalcButton,
        child: Center(
          child: child,
        ),
      ),
      onTap: onTap,
    );
  }
}

class _MaterialButton extends CustomFullWidthButton {
  _MaterialButton({
    Key key,
    Widget child,
    @required GestureTapCallback onTap,
  }) : super(
          key: key,
          child: child,
          onTap: onTap,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: RawMaterialButton(
        constraints: BoxConstraints.tightFor(
          width: double.infinity,
          height: 60.0,
        ),
        fillColor: kButtonCalcColor,
        child: child,
        onPressed: onTap,
      ),
    );
  }
}
