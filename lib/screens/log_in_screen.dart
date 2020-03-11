import 'package:flutter/material.dart';
import 'package:hive/const.dart';
import 'package:hive/services/login.dart';
import 'package:hive/widgets/login_button.dart';
import 'main_menu.dart';
import 'package:hive/widgets/styled_input_field.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  String email = 'jan@wp.pl';
  String password = 'kwakwa5!';
  String warning = '';

  Future logIn() async {
    String response = await GetData.getPrimaryData(email, password);
    if (response == 'error') {
      setState(() {
        warning = 'Nie można zalogować';
      });
    } else if (response == 'Nie ma takiego użytkownika.') {
      setState(() {
        warning = response;
      });
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(
                    response: response,
                  )));
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Image.asset('assets/hive_logo_orange.png'),
                    width: 150,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "H.I.V.E.",
                    style: kTextStyleLogo.copyWith(color: Color(kOrange)),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$warning',
                    style: kWarning,
                  ),
                ),
                StyledInputField(
                  hintText: 'wprowadź e-mail',
                  password: false,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                StyledInputField(
                  hintText: 'wprowadź hasło',
                  password: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                LogInButton(
                  label: 'Zaloguj',
                  color: Color(kOrange),
                  onPressed: () async {
                    logIn();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
