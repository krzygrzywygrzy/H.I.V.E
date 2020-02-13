import 'dart:convert';
import 'package:hive/const.dart';
import 'package:http/http.dart' as http;

class HiveAdd {
  static Future<String> add(
      String email, String hiveCode, String hiveName) async {
    var hiveApi = '/api/hive/';
    var data = jsonEncode(
        {'email': '$email', 'hiveCode': '$hiveCode', 'hiveName': '$hiveName'});
    String message = '';

    try {
      await http
          .post('$URL' + '$hiveApi', body: data, headers: HEADERS)
          .then((var response) {
        if (response.statusCode == 200) {
          var json = jsonDecode(response.body);
          var data = json['message'];
          if (data == 'Nie udało się!') message = json['specyfic'];
          else message = 'done';
        }
      });
    } catch (e) {
      message = 'error';
    }
    return message;
  }
}
