import 'package:flutter/material.dart';
import 'package:hive/const.dart';

class StyledInputField extends StatelessWidget {
  StyledInputField(
      {@required this.hintText, this.onChanged, @required this.password, this.email=false});
  final String hintText;
  final Function onChanged;
  final bool password;
  final bool email;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 300,
      child: TextField(
        keyboardType: email ? TextInputType.emailAddress : TextInputType.text,
        onChanged: onChanged,
        obscureText: password,
        style: TextStyle(color: Color(kBrown)),
        decoration: InputDecoration(
          hintText: '$hintText',
          hintStyle: TextStyle(color: Color(kBrown)),
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
