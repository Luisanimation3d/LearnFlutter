import 'package:flutter/material.dart';

class SecondView extends StatelessWidget {
  const SecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Some'),
      ),
      body: Center(
        child: Image.network('https://picsum.photos/250?image=9')
      ),
    );
  }
}