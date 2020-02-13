import 'package:flutter/material.dart';
import 'package:hive/const.dart';
import 'package:hive/screens/details.dart';
import 'package:hive/services/measurement.dart';

class Oval extends StatelessWidget {
  Oval({
    this.measurement,
    this.unit,
    this.data,
    this.details,
    this.iterator,
  });
  final String measurement, unit;
  final int data, iterator;
  final List<Measurement> details;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: GestureDetector(
        onTap: () {
         Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Details(
                        name: measurement,
                        detalis: details,
                        unit: unit,
                      )));
        },
        child: ClipOval(
          child: Container(
            width: 100,
            height: 100,
            color: Color(kGrey),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: '$data',
                    style: kOvalButtonValue,
                    children: <TextSpan>[
                      TextSpan(
                        text: '$unit',
                        style: kOvalButtonValue.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Text(
                  "$measurement",
                  style: kOvalButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
