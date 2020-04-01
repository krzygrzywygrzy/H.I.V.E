import 'package:flutter/material.dart';
import 'package:hive/const.dart';
import 'package:hive/widgets/oval_button.dart';
import 'package:hive/data.dart';
import 'package:hive/services/measurement.dart';

class HiveCard extends StatelessWidget {
  HiveCard({this.hiveName, this.measurement});
  final String hiveName;
  final Measurement measurement;

  List<Widget> generateOval(bool firstColumn) {
    int i, limit;
    List<Widget> list = [];
    if (firstColumn)
      i = 0;
    else
      i = 3;
    limit = i + 2;
    for (; i <= limit; i++) {
      list.add(Oval(
        measurement: readingList[i],
        unit: units[i],
        data: data(i),
      ));
    }
    return list;
  }

  int data(int i) {
    int data;
    switch (i) {
      case 0:
        data = measurement.temperature.floor();
        break;
      case 1:
        data = measurement.weight.floor();
        break;
      case 2:
        data = measurement.pressure.floor();
        break;
      case 3:
        data = measurement.humidity.floor();
        break;
      case 4:
        data = measurement.pm25.floor();
        break;
      case 5:
        data = measurement.pm10.floor();
        break;
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            children: <Widget>[
              SizedBox(height: 10),
              Expanded(
                flex: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  child: Container(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: '$hiveName',
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: generateOval(true),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: generateOval(false),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
