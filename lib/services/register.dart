import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive/const.dart';

class UserRegister {
  static Future<String> register(String firstName, String secondName,
      String email, String password) async {
    String registered;
    var registerApi = '/api/user/register/';
    var registerData = jsonEncode({
      "firstName": '$firstName',
      "secoundName": '$secondName',
      "email": '$email',
      "password": '$password',
      "check": true,
    });

    try {
      await http
          .post(
        Uri.encodeFull('$URL' + '$registerApi'),
        body: registerData,
        headers: HEADERS,
      )
          .then((var response) async {
        if (response.statusCode == 200) {
          var json = jsonDecode(response.body);
          var data = json['message'];
          if (data == 'Nie udało się!') {
            registered = json['specyfic'];
          } else if (data == 'Udało się!') {
            registered = 'done';
          } else {
            registered = 'error';
          }
        }
      });
    } catch (e) {
      print(e);
      registered = 'error';
    }
    return registered;
  }
}
