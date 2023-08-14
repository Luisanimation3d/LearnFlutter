import 'package:flutter/material.dart';
import 'dart:math';

class calculadora extends StatefulWidget {
  const calculadora({Key? key}) : super(key: key);

  @override
  State<calculadora> createState() => _calculadoraState();
}

class _calculadoraState extends State<calculadora> {
  final controlOne = TextEditingController();
  final controlTwo = TextEditingController();
  final controlThree = TextEditingController();
  double resultado = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Calculadora'),
          ),
          body: Center(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 20),
                      TextField(
                        controller: controlOne,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Digite o valor',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: controlTwo,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Digite o valor',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: controlThree,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Digite o valor',
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () => {
                                    setState(() {
                                      // resultado = double.parse('${controlOne.text}${controlTwo.text}');
                                      resultado = double.parse(controlOne.text) +
                                          double.parse(controlTwo.text);
                                      controlThree.text = resultado.toString();
                                    })
                                  },
                              icon: const Icon(Icons.add)),
                          IconButton(
                              onPressed: () => {
                                    setState(() {
                                      resultado = double.parse(controlOne.text) -
                                          double.parse(controlTwo.text);
                                      controlThree.text = resultado.toString();
                                    })
                                  },
                              icon: const Icon(Icons.remove)),
                          IconButton(
                              onPressed: () => {
                                    setState(() {
                                      resultado = double.parse(controlOne.text) *
                                          double.parse(controlTwo.text);
                                      controlThree.text = resultado.toString();
                                    })
                                  },
                              icon: const Icon(Icons.close)),
                          IconButton(
                            onPressed: () => {
                              setState(() {
                                resultado = double.parse(controlOne.text) /
                                    double.parse(controlTwo.text);
                                controlThree.text = resultado.toString();
                              })
                            },
                            icon: const Text('/'),
                          ),
                          IconButton(
                            onPressed: () => {
                              setState(() {
                                resultado = double.parse(controlOne.text) %
                                    double.parse(controlTwo.text);
                                controlThree.text = resultado.toString();
                              })
                            },
                            icon: Icon(Icons.percent),
                          ),
                          IconButton(
                            onPressed: () => {
                              setState(() {
                                resultado = pow(double.parse(controlOne.text),
                                    double.parse(controlTwo.text)) as double;
                                controlThree.text = resultado.toString();
                              })
                            },
                            icon: const Icon(Icons.pregnant_woman_sharp),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.amber.shade900;
                                  }
                                  return Colors.amber; // Use the default value.
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
