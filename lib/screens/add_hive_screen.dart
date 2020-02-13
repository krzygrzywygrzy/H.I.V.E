import 'package:flutter/material.dart';
import 'package:hive/const.dart';
import 'package:hive/screens/main_menu.dart';
import 'package:hive/widgets/login_button.dart';
import 'package:hive/widgets/styled_input_field.dart';
import 'package:hive/services/add_hive.dart';
import 'package:hive/services/login.dart';

class AddHive extends StatefulWidget {
  AddHive({this.email, this.password});
  final String email;
  final String password;
  @override
  _AddHiveState createState() => _AddHiveState();
}

class _AddHiveState extends State<AddHive> {
  String hiveCode = '';
  String hiveName = '';
  String warning = '';

  Future add() async {
    if (hiveCode != '' && hiveName != '') {
      String message = await HiveAdd.add(widget.email, hiveCode, hiveName);
      if (message == 'done') {
        var response =
            await GetData.getPrimaryData(widget.email, widget.password);
        if (response != 'error') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(
                        response: response,
                      )));
        }
      }
      else if(message == 'error') {
        setState(() {
          warning = 'Wystąpił błąd';
        });
      }
      else {
        setState(() {
          warning = message;
        });
      }
    }
    else {
      setState(() {
        warning = 'Pola nie mogą być puste';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Dodaj nowy ul',
                  style: kTextStyleTwo.copyWith(color: Color(kOrange)),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '$warning',
              style: kWarning,
            ),
            SizedBox(
              height: 8,
            ),
            StyledInputField(
              password: false,
              hintText: 'nazwa ula',
              onChanged: (value) {
                setState(() {
                  hiveName = value;
                });
              },
            ),
            StyledInputField(
              password: false,
              hintText: 'kod',
              onChanged: (value) {
                setState(() {
                  hiveCode = value;
                });
              },
            ),
            LogInButton(
              label: 'Dodaj',
              color: Color(kOrange),
              onPressed: () async {
                add();
              },
            ),
          ],
        ),
      ),
    );
  }
}
