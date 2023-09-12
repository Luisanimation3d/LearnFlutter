import 'package:flutter/material.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: const Color.fromARGB(255, 159, 33, 47),
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 159, 33, 47),
      elevation: 0,
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
       
      ),
      bodySmall: TextStyle(
        fontSize: 12,
       
      ), 
    ),
  );
}