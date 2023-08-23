import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.amber,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromARGB(255, 226, 37, 3),
      onPrimary: Color.fromARGB(255, 236, 165, 143),
      secondary: Color.fromARGB(255, 124, 1, 1),
      onSecondary: Color.fromARGB(255, 124, 1, 1),
      background: Color.fromARGB(9, 248, 181, 150),
      onBackground: Color.fromARGB(9, 248, 181, 150),
      surface: Color.fromARGB(255, 124, 1, 1),
      onSurface: Color.fromARGB(255, 124, 1, 1),
      error: Colors.red, onError: Colors.black)
  );
}