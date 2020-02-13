import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/const.dart';
import 'package:hive/services/login.dart';

class Details extends StatefulWidget {
  Details({
    this.name,
    this.detalis,
  });
  final String name;
  final String detalis;
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int sliderValue = 0;

  @override
  initState() {
    super.initState();
    fetchData();
  }

  Future<String> fetchData() async {
    var data = await GetData.getPrimaryData('jan@wp.pl', 'kwakwa5!');
    var json = jsonDecode(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Color(kBrown),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(widget.name,
                style: kTextStyleTwo.copyWith(
                  color: Color(kOrange),
                )),
            Slider(
              activeColor: Color(kOrange),
              inactiveColor: Color(kBrown),
              value: sliderValue.toDouble(),
              min: 0,
              max: 15,
              onChanged: (double value) {
                setState(() {
                  sliderValue = value.toInt();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
