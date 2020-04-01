import 'package:flutter/material.dart';
import 'package:hive/const.dart';

class AverageRichText extends StatelessWidget {
  AverageRichText({this.unit, this.label, this.average});
  final String unit;
  final String label;
  final String average;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
            text: '$label',
            style: TextStyle(color: Color(kBrown), fontSize: 25),
            children: <TextSpan>[
              TextSpan(
                text: average,
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
              TextSpan(text: '$unit'),
            ],
          ),
        ),
      ),
    );
  }
}
