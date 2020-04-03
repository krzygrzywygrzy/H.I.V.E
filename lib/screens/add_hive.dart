import 'package:flutter/material.dart';
import 'package:hive/widgets/styled_input_field.dart';
import 'package:hive/widgets/login_button.dart';

class AddHive extends StatelessWidget {
  AddHive({this.email});
  final String email;

  String hiveName;
  String hiveCode;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Text(
            'Dodaj ul',
            style: TextStyle(fontSize: 30, letterSpacing: 1.2),
          ),
          SizedBox(
            height: 30,
          ),
          StyledInputField(
            hintText: 'nazwa ula',
            password: false,
            onChanged: (value) {
              hiveName = value;
            },
          ),
          StyledInputField(
            hintText: 'kod ula',
            password: false,
            onChanged: (value) {
              hiveName = value;
            },
          ),
          LogInButton(
            label: "Dodaj",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
