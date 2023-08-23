import 'package:flutter/material.dart';
import 'package:flutter_application_9/Componentes/inputCampo.dart';

class formView extends StatefulWidget {
  const formView({super.key});
  @override
  State<formView> createState() => _formViewState();
}

class _formViewState extends State<formView> {

  TextEditingController cantidadAvesController = TextEditingController();
  TextEditingController cantidadConcentradoController = TextEditingController();
  TextEditingController cantidadBultosController = TextEditingController();

  double resultado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Taller Luis Angel Correa y Daniel Yovany Rivera')),
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Form(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                          children: [
                            InputCampo(label: "Cantidad de aves", controller: cantidadAvesController, obscureText: false, validator: (value) => value!.isEmpty ? "Ingrese la cantidad de aves" : null, keyboardType: TextInputType.number),
                            const SizedBox(height: 10),
                            InputCampo(label: "Cantidad de concentrado que consume", controller: cantidadConcentradoController, obscureText: false, validator: (value) => value!.isEmpty ? "Ingrese la cantidad de concentrado que consume" : null, keyboardType: TextInputType.number),
                            const SizedBox(height: 10),
                            InputCampo(label: "Cantidad de bultos de concentrado", controller: cantidadBultosController, obscureText: false, validator: (value) => value!.isEmpty ? "Ingrese la cantidad de bultos de concentrado" : null, keyboardType: TextInputType.number),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  resultado = (double.parse(cantidadBultosController.text) * 40 * 1000) / (double.parse(cantidadAvesController.text) * double.parse(cantidadConcentradoController.text));
                                });
                              },
                              child: const Text('Validar'),
                            ),
                            const SizedBox(height: 10),
                            Text("$resultado"),
                          ],
                        ),
                  )))),
    );
  }
}
