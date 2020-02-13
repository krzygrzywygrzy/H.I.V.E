import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive/const.dart';

class GetData {
  static Future<String> getPrimaryData(var email, var password) async {
    //TODO:
    var res =
        '{"message":"Nie udało się!","specyfic":"Nie ma takiego użytkownika."}';
    var loginApi = '/api/user/login/';
    var loginData = jsonEncode({"email": '$email', "password": '$password'});
    String data = '';
    try {
      await http
          .post(
        Uri.encodeFull('$URL' + '$loginApi'),
        body: loginData,
        headers: HEADERS,
      )
          .then((var response) {
        if (response.statusCode == 200 && response.body == res) {
          var json = jsonDecode(response.body);
          data =json['specyfic'];
        } else {
          data = response.body;
        }
      });
    } catch (e) {
      data = 'error';
    }
    return data;
  }
}
