import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/services/user.dart';
import 'display_measurement.dart';
import 'package:hive/services/measurement.dart';

import 'package:hive/widgets/sliver_top_bar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({@required this.response});
  final String response;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Measurement> measurement = [];
  User user;
  DateTime currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  initState() {
    super.initState();
    fetchData();
  }

  fetchData() {
    try {
      var json = jsonDecode(widget.response);
      user = new User.fromJson(json['user']);
      for (int i = 0; i <= user.ownedHives.length - 1; i++) {
        measurement.add(new Measurement.fromJson(json['hives'][i]['last'][0]));
      }
    } catch (e) {
      print(e);
    }
  }

  List<Widget> hiveData() {
    List<Widget> list = [];
    for (int i = 0; i <= user.hiveNames.length - 1; i++) {
      list.add(HiveCard(
        hiveName: user.hiveNames[i],
        measurement: measurement[i],
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: onWillPop,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: TopBar(name: user.firstName),
              floating: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return HiveCard(
                  measurement: measurement[index],
                  hiveName: user.hiveNames[index],
                );
              }, childCount: measurement.length - 1),
            ),
          ],
        ),
      ),
    );
  }
}
