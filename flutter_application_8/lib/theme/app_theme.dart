import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.green;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    appBarTheme: const AppBarTheme(
      color: Colors.red,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.green,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.amberAccent
      ),
      bodySmall: TextStyle(
        fontSize: 12,
      ), 
    ),
  );
}