import 'package:flutter/material.dart';
import 'package:hive/const.dart';
import 'package:hive/widgets/login_button.dart';
import 'package:hive/services/register.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<bool> autoLogIn() async {
    //TODO: fix bug with file reading and writing

  /* ReadFile rf = new ReadFile();
    LoginInfo login = await rf.read();
    if (login.loggedin == true) {
      String response =
          await GetData.getPrimaryData(login.email, login.password);
      if (response != 'error') {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(
                      response: response,
                    )));
      }
    } else{
    return false;
   } */
  return false;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100,
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
            FutureBuilder(
              future: autoLogIn(),
              builder: ((BuildContext context, AsyncSnapshot snapshot) {
                List<Widget> layout = [];
                if (snapshot.hasData) {
                  layout = [
                    SizedBox(height: 20),
                    LogInButton(
                      color: Color(kOrange),
                      label: 'Zaloguj',
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                    LogInButton(
                      label: 'Zarejestruj',
                      color: Color(kBrown),
                      onPressed: (){
                        Navigator.pushNamed(context, '/register');
                      },
                    ),
                  ];
                }
                return Column(
                  children: layout,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
