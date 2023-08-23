import 'package:flutter/material.dart';
import 'package:flutter_application_8/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Main App')),
        body: Center(
            child: Text('Main App',
                style: Theme.of(context).textTheme.bodyMedium)),
      ),
      theme: AppTheme.lightTheme,
    );
  }
}
