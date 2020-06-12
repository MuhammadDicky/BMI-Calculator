import 'package:bmi_calculator/config/constants.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    Key key,
    this.child,
    this.color,
    this.onTap,
  }) : super(key: key);

  factory CustomCard.withExpanded({
    Widget child,
    Color color,
    GestureTapCallback onTap,
  }) = _WithExpanded;

  final Widget child;
  final Color color;
  final bool expanded = false;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    Widget result = GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(kContentPadding),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: child,
      ),
    );

    if (expanded) result = Expanded(child: result);

    return result;
  }
}

class _WithExpanded extends CustomCard {
  _WithExpanded({
    Widget child,
    Color color,
    GestureTapCallback onTap,
  }) : super(
          child: child,
          color: color,
          onTap: onTap,
        );

  @override
  bool get expanded => true;
}
