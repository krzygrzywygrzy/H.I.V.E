import 'package:flutter/material.dart';
import 'package:hive/const.dart';
import 'package:hive/screens/details.dart';
import 'package:hive/services/measurement.dart';

class Oval extends StatelessWidget {
  Oval({
    this.measurement,
    this.unit,
    this.data,
    this.iterator,
  });
  final String measurement, unit;
  final int data, iterator;

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
                        unit: unit,
                      )));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.width * 0.25,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(0, 3),
                spreadRadius: 0.5,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: '$data',
                  style: TextStyle(
                    color: Color(kOrange),
                    fontSize: 24,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '$unit',
                      style: TextStyle(
                        color: Color(kOrange),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "$measurement",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
