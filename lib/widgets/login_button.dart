import 'package:flutter/material.dart';
import 'package:hive/const.dart';

class LogInButton extends StatelessWidget {
  LogInButton({this.onPressed, this.color, this.textColor, this.label});
  final Function onPressed;
  final Color color;
  final Color textColor;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30),
        borderOnForeground: true,
        elevation: 3,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 300,
          height: 42,
          child:
              Text('$label', style: kTextStyleOne.copyWith(color: textColor)),
        ),
      ),
    );
  }
}
