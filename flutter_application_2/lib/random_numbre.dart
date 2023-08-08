import 'dart:math';

import 'package:flutter/material.dart';

class GeneratorRandomNumber extends StatefulWidget {
  const GeneratorRandomNumber({super.key});

  @override
  State<GeneratorRandomNumber> createState() => GeneratorRandomNumberState();
}

class GeneratorRandomNumberState extends State<GeneratorRandomNumber> {
  String randomNumber = '000';
  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    return Scaffold(
        body: Center(
          child: Text(
            'Random Number: $randomNumber',
            style: const TextStyle(fontSize: 30),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Container(
              width: 150,
              child: FloatingActionButton(
                child: const Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    randomNumber = '${random.nextInt(1000)}';
                    randomNumber = int.parse(randomNumber) < 10
                        ? '00$randomNumber'
                        : int.parse(randomNumber) < 100
                            ? '0$randomNumber'
                            : randomNumber;
                  });
                },
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              )),
        ]));
  }
}
