import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool darkThemeEnabled;

  ThemeProvider({
    this.darkThemeEnabled = true,
  });

  void changeTheme() {
    darkThemeEnabled = !darkThemeEnabled;
    notifyListeners();
  }
}
