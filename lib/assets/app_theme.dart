import 'package:flutter/material.dart';

class AppTheme {
  // Shared Colors
  static const Color primaryGreen = Color(0xFF4CAF50); // Primary green
  static const Color lightGreen =
      Color(0xFF81C784); // Lighter green for highlights
  static const Color darkGreen = Color(0xFF388E3C); // Darker green for accents
  static const Color black = Color(0xFF000000); // Pure black
  static const Color white = Color(0xFFFFFFFF); // Pure white
  static const Color grey =
      Color(0xFFBDBDBD); // Neutral grey for subtle elements

  // Dark Theme
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primaryGreen,
    scaffoldBackgroundColor: black,
    appBarTheme: const AppBarTheme(
      backgroundColor: black,
      foregroundColor: white,
      elevation: 0,
    ),
    colorScheme: const ColorScheme.dark(
      primary: primaryGreen,
      onPrimary: white,
      secondary: lightGreen,
      onSecondary: Color.fromARGB(255, 31, 31, 31),
      surface: darkGreen,
      onSurface: white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: white),
      bodyMedium: TextStyle(color: grey),
      bodySmall: TextStyle(color: grey),
      headlineLarge: TextStyle(color: white),
      headlineMedium: TextStyle(color: white),
    ),
    switchTheme: const SwitchThemeData(
      thumbColor: WidgetStatePropertyAll(primaryGreen),
      trackColor: WidgetStatePropertyAll(grey),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryGreen,
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: const IconThemeData(
      color: white,
    ),
  );

  // Light Theme
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryGreen,
    scaffoldBackgroundColor: white,
    appBarTheme: const AppBarTheme(
      backgroundColor: lightGreen,
      foregroundColor: white,
      elevation: 0,
    ),
    colorScheme: const ColorScheme.light(
      primary: primaryGreen,
      onPrimary: white,
      secondary: darkGreen,
      onSecondary: white,
      surface: grey,
      onSurface: black,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: black),
      bodyMedium: TextStyle(color: grey),
      bodySmall: TextStyle(color: grey),
      headlineLarge: TextStyle(color: black),
      headlineMedium: TextStyle(color: black),
    ),
    switchTheme: const SwitchThemeData(
      thumbColor: WidgetStatePropertyAll(primaryGreen),
      trackColor: WidgetStatePropertyAll(Color.fromARGB(183, 0, 0, 0)),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryGreen,
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: const IconThemeData(
      color: black,
    ),
  );
}
