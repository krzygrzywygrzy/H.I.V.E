import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/const.dart';
import 'package:hive/services/user.dart';
import 'display_measurement.dart';
import 'package:hive/services/measurement.dart';
import 'add_hive_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({@required this.response});
  final String response;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Measurement> measurement = [];
  User user;
  List<List<Measurement>> details = [];

  @override
  initState() {
    super.initState();
    fetchData();

  }

  fetchData() {
    try {
      var json = jsonDecode(widget.response);
      user = new User.fromJson(json['user']);
      for(int i= 0; i <= user.ownedHives.length -1; i++){
        measurement.add(new Measurement.fromJson(json['hives'][i]['last'][0]));
        var full = json['hives'][i]['full'] as List;
        List<Measurement> list = full.map((x)=> Measurement.fromJson(x)).toList();
        details.add(list);
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
        details: details[i],
      ));
    }
    return list;
  }



  @override
  Widget build(BuildContext context) {
    // main menu
    return Scaffold(
      backgroundColor: Color(kOrange),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Text('H.I.V.E.',
                      style: kTextStyleLogo.copyWith(fontSize: 50)),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Witaj',
                                    style: kTextStyleOne.copyWith(
                                        color: Color(kBrown)),
                                  ),
                                  Text(
                                    user.firstName +
                                        " " +
                                        user.secondName +
                                        "!",
                                    style: kTextStyleOne.copyWith(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: hiveData(),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddHive(
                                    email: user.email,
                                  )));
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(kBrown),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Dodaj ul',
                          style: kTextStyleOne.copyWith(
                              fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
