class User {
  String firstName, secondName, email, password;
  List hiveNames, ownedHives;

  User(
      {this.firstName,
      this.secondName,
      this.email,
      this.password,
      this.hiveNames,
      this.ownedHives});

  User.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'],
        secondName = json['secoundName'], //TODO: correct after server update
        email = json['email'],
        password = json['password'],
        hiveNames = json['hiveNames'],
        ownedHives = json['ownedHives'];
}

class LoginInfo {
  String email, password;
  bool loggedin;

  LoginInfo({this.email, this.password, this.loggedin});

  LoginInfo.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'],
        loggedin = json['loggedin'];

  Map<String, dynamic> toJson() => {
    'password': password,
    'email': email,
    'loggedin' : loggedin,
  };
}
