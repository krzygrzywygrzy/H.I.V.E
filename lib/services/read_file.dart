import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'user.dart';

class ReadFile {

  Future<File> localFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return await new File('$dir/login.json');
  }

 /*  Future<File> write(LoginInfo login) async {
    try {
      File file = await localFile;
      var json = login.toJson();
      var data = jsonEncode(json);
      await file.write
    } catch (e) {
      print(e);
    }
  }

  Future<LoginInfo> read() async {
    try {
      final file = await localFile;
      String json = await file.readAsString();
      var data = jsonDecode(json);
      LoginInfo login = new LoginInfo.fromJson(data);
      return login;
    } catch (e) {
      return new LoginInfo();
    }
  } */
}
