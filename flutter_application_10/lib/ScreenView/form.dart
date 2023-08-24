import 'package:flutter/material.dart';
import 'package:flutter_application_10/Components/dropDown.dart';
import 'package:flutter_application_10/Components/inputs.dart';

class form extends StatefulWidget {
  const form({super.key});

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  final TextEditingController valorUnitarioController = TextEditingController();
  final TextEditingController cantidadController = TextEditingController();
  double valorTotal = 0;
  List<Image> images = [
    Image.network('https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80'),
    Image.network('https://images.unsplash.com/photo-1625772452859-1c03d5bf1137?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80'),
    Image.network('https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80')
  ];
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: SingleChildScrollView(
              child: Form(
                  child: Column(children: [
                      dropDown(
                value: 'producto 1',
                items: const [
                  'producto 1',
                  'producto 2',
                  'producto 3',
                  'producto 4',
                  'producto 5',
                  'producto 6',
                  'producto 7',
                  'producto 8',
                  'producto 9',
                  'producto 10',
                ],
                onChanged: (value) => {
                      setState(() {
                        index = int.parse(value!.split(' ')[1]);
                      })
                }),
                      const SizedBox(height: 20),
                      images[index%3],
                      const SizedBox(height: 20),
                      InputCampo(
                label: "Valor Unitario",
                controller: valorUnitarioController,
                keyboardType: TextInputType.number,
                obscureText: false,
                validator: (value) => value!.isEmpty ? "Ingrese un valor" : null),
                      const SizedBox(height: 20),
                      InputCampo(
                label: "Cantidad",
                controller: cantidadController,
                keyboardType: TextInputType.number,
                obscureText: false,
                validator: (value) => value!.isEmpty ? "Ingrese un valor" : null),
                      const SizedBox(height: 20),
                      Text("Valor Total: $valorTotal"),
                      const SizedBox(height: 20),
                      ElevatedButton(
                onPressed: () {
                  setState(() {
                    valorTotal = double.parse(valorUnitarioController.text) *
                        double.parse(cantidadController.text);
                  });
                },
                child: const Text('Calcular')),
                    ])),
            )),
      ),
    );
  }
}
