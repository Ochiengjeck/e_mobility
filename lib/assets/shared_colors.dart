// Providers
import 'package:ev_app/providers/theme_provider.dart';
import 'package:ev_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SharedColors {
  final BuildContext context;

  SharedColors(this.context);

  ThemeProvider get theme => Provider.of<ThemeProvider>(context, listen: false);
  UserProvider get user => Provider.of<UserProvider>(context, listen: false);

  // Colors
  Color? get containerColor =>
      theme.darkThemeEnabled ? const Color.fromARGB(255, 31, 31, 31) : null;
  Color? get innerContainerColor =>
      theme.darkThemeEnabled ? const Color.fromARGB(255, 88, 88, 88) : null;
  Color? get indicator =>
      theme.darkThemeEnabled ? const Color.fromARGB(255, 10, 83, 17) : null;
  Color labelColor = Colors.white;

  Color? get headingColor => theme.darkThemeEnabled
      ? Colors.greenAccent
      : const Color.fromARGB(255, 14, 94, 16);
  Color? get textColor => theme.darkThemeEnabled ? Colors.white : Colors.black;
}
