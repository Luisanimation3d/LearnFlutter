import 'package:flutter/material.dart';
import 'package:flutter_application_9/ScreenView/formView.dart';
import 'package:flutter_application_9/theme/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const formView()
    );
  }
}
