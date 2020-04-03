import 'package:flutter/material.dart';
import 'package:hive/screens/log_in_screen.dart';
import 'package:hive/screens/main_menu.dart';
import 'package:hive/screens/register_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'H.I.V.E.',
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      // initialRoute: '/',
      home: MyHomePage(),
      /* routes: {
        '/': (context) => LogIn(),
        '/register': (context) => Register(),
      }, */
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
