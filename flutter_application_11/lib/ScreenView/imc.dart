import 'package:flutter/material.dart';
import 'package:flutter_application_11/Components/input.dart';

final TextEditingController pesoController = TextEditingController();
final TextEditingController alturaController = TextEditingController();
double imc = 0;

class IMCViewComponent extends StatefulWidget {
  const IMCViewComponent({super.key});

  @override
  State<IMCViewComponent> createState() => _IMCViewComponentState();
}

class _IMCViewComponentState extends State<IMCViewComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
              child: Column(
            children: [
              InputComponent(
                label: 'Peso',
                controller: pesoController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              InputComponent(
                  label: 'Altura',
                  controller: alturaController,
                  keyboardType: TextInputType.number),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    imc = double.parse(pesoController.text) /
                        (double.parse(alturaController.text) *
                            double.parse(alturaController.text));
                  });
                },
                child: const Text('Calcular'),
              ),
              const SizedBox(height: 10),
              Text('IMC: ${imc} ${imc < 18.5 ? 'Peso inferior al normal' : (imc >= 18.5 && imc <= 24.9) ? 'Peso normal' : (imc >= 25 && imc <= 29.9) ? 'Peso superior al normal' : 'Obesidad'}', style: const TextStyle(fontSize: 24)),
            ],
          )),
        ),
      ),
    );
  }
}
