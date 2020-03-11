import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/const.dart';
import 'package:hive/services/user.dart';
import 'display_measurement.dart';
import 'package:hive/services/measurement.dart';
import 'add_hive_screen.dart';
import 'package:hive/widgets/sliver_top_bar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({this.response});
  final String response;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Measurement> measurement = [];
  User user;

  @override
  initState() {
    super.initState();
    addMeasurements();
  }


  addMeasurements(){
    for(int i = 0; i <= 3; i++){
      measurement.add(new Measurement(temperature: 3, weight: 3, humidity: 3, pressure: 3, pm10: 3, pm25: 3));
    }
  }



  /*

   fetchData() {
    try {
      var json = jsonDecode(widget.response);
      user = new User.fromJson(json['user']);
      for(int i= 0; i <= user.ownedHives.length -1; i++){
        measurement.add(new Measurement.fromJson(json['hives'][i]['last'][0]));
      }
    } catch (e) {
      print(e);
    }
  }

  List<Widget> hiveData() {
    List<Widget> list = [];
    for (int i = 0; i <= user.hiveNames.length - 1; i++){
      list.add(HiveCard(
       hiveName: user.hiveNames[i],
        measurement: measurement[i],
      ));
    }
    return list;
  }
 */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: DrawerItems(),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: TopBar(name: "Jaca"),
            floating: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return HiveCard(
                measurement: measurement[index],
                hiveName: "tak",
              );
            },
            childCount: measurement.length-1),
          ),
        ],
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Row(
            children: <Widget>[
              Icon(
                Icons.account_circle,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
              SizedBox(width: 10,),
              Text(
                'Ustawienia konta',
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ],
    );
  }
}



