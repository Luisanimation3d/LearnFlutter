import 'dart:io';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Center(
          child: Text(
            'Sigue siendo mejor React Native',
            style: TextStyle(color: Colors.brown),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text('número de clicks: ', style: TextStyle(fontSize: 50),),
            Text('$contador', style: TextStyle(color: Color.fromARGB(255, 205, 10, 88), fontSize: 65))
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.coronavirus_outlined),
            onPressed: (){
              contador --;
              setState(() {});
            }
          ),
          FloatingActionButton(
            child: const Icon(Icons.reset_tv_outlined),
            onPressed: (){
              contador = 0;
              setState(() {});
            }
          ),
          FloatingActionButton(
            child: const Icon(Icons.content_paste_go_outlined),
            onPressed: (){
              contador++;
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}