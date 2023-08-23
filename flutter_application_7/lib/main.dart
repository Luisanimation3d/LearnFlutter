import 'package:flutter/material.dart';
import 'package:flutter_application_7/calculator.dart';
import 'package:flutter_application_7/dropDown.dart';
import 'package:flutter_application_7/tarifas.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Tarifa(),
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
    );
  }
}
