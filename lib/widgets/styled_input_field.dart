import 'package:flutter/material.dart';
import 'package:hive/const.dart';

class StyledInputField extends StatelessWidget {
  StyledInputField(
      {@required this.hintText, this.onChanged, @required this.password});
  final String hintText;
  final Function onChanged;
  final bool password;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 300,
      child: TextField(
        onChanged: onChanged,
        obscureText: password,
        style: kInputField,
        decoration: InputDecoration(
          hintText: '$hintText',
          hintStyle: kInputField,
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: Color(kBrown), width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: Color(kBrown), width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(kBrown), width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
        ),
      ),
    );
  }
}
