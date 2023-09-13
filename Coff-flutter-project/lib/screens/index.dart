import 'package:flutter/material.dart';

class HelloWorldView extends StatelessWidget {
  const HelloWorldView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modulos'),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: Center(
        child: const Text(
          'Hola Mundo',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}