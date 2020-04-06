import 'package:flutter/material.dart';
import 'package:hive/const.dart';
import 'package:hive/screens/main_menu.dart';
import 'package:hive/widgets/login_button.dart';
import 'package:hive/widgets/styled_input_field.dart';
import 'package:hive/services/register.dart';
import 'package:hive/services/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String firstName, secondName, email, password, message = '';

  register() async {
    try {
      String reg =
          await UserRegister.register(firstName, secondName, email, password);

      if (firstName == '' &&
          secondName == '' &&
          email == '' &&
          password == '') {
        setState(() {
          message = 'Pola nie mogą być puste';
        });
      } else {
        if (reg == 'done') {
          GetData data = new GetData();
          var response = await data.getPrimaryData(email, password);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(
                        response: response,
                      )));
        } else if (reg == 'error') {
          setState(() {
            message = 'Użytkownik już istnieje';
          });
        } else {
          setState(() {
            message = reg;
          });
        }
      }
    } catch (e) {
      setState(() {
        message = 'Wystąpił błąd';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
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
                  '$message',
                  style: kWarning,
                ),
              ),
              StyledInputField(
                password: false,
                hintText: 'imię',
                onChanged: (value) {
                  setState(() {
                    firstName = value;
                  });
                },
              ),
              StyledInputField(
                password: false,
                hintText: 'nazwisko',
                onChanged: (value) {
                  setState(() {
                    secondName = value;
                  });
                },
              ),
              StyledInputField(
                password: false,
                hintText: 'e-mail',
                email: true,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              StyledInputField(
                password: true,
                hintText: 'hasło',
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              LogInButton(
                label: "Zajerestruj",
                onPressed: () async {
                  register();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
