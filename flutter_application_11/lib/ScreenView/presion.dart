import 'package:flutter/material.dart';
import 'package:flutter_application_11/Components/input.dart';

class PersionArtetialViewComponent extends StatefulWidget {
  const PersionArtetialViewComponent({super.key});

  @override
  State<PersionArtetialViewComponent> createState() =>
      _PersionArtetialViewComponentState();
}

class _PersionArtetialViewComponentState
    extends State<PersionArtetialViewComponent> {
  final TextEditingController presionController = TextEditingController();
  String mensaje = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Presión Arterial'),
          ),
          body: SingleChildScrollView(
              child: Form(
            child: Column(children: [
              InputComponent(
                  label: 'Presión Arterial',
                  controller: presionController,
                  keyboardType: TextInputType.number),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      mensaje = double.parse(presionController.text) < 120 ? 'Normal' : double.parse(presionController.text) >= 120 && double.parse(presionController.text) < 129 ? 'Presión arterial alta (sin otros factores de riesgo cardíaco)' : double.parse(presionController.text) >= 130 && double.parse(presionController.text) < 179 ? 'Presión arterial alta (con otros factores de riesgo cardíaco, según algunos proveedores)' : 'Presión arterial peligrosamente alta - Busque atención médica de inmediato';
                    });
                  }, child: const Text('Calcular')),
                  const SizedBox(height: 20),
                  Text(mensaje)
            ]),
          ))),
    );
  }
}
