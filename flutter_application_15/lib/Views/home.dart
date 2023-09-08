import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey,
        child: Text('Hola'),
        padding: EdgeInsets.all(8),
      ),
    );
  }
}