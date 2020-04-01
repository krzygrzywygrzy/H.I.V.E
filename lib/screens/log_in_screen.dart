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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
            ),
            Flexible(
              child: Hero(
                tag: "logo",
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Image.asset('assets/hive_logo_orange.png'),
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "H.I.V.E.",
                style: TextStyle(
                  fontFamily: 'ZhiMangXing',
                  color: Color(kOrange),
                  fontSize: 40,
                ),
              ),
            ),
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
              email: true,
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
              onPressed: () async {
                logIn();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Nie masz konta?',
                  style: TextStyle(fontFamily: "Montserrat"),
                ),
                GestureDetector(
                  child: Text(
                    ' Zarejestruj się!',
                    style: TextStyle(
                        fontFamily: "Montserrat", color: Color(kOrange)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
