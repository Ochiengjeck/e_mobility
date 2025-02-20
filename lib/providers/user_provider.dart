import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String userName;
  String email;
  int phoneNumber;
  String password;

  UserProvider({
    this.userName = "",
    this.email = "",
    this.phoneNumber = 0,
    this.password = "",
  });

  void changeName(String name) {
    userName = name;
    notifyListeners();
  }

  void changeEmail(String mail) {
    email = mail;
    notifyListeners();
  }
}
