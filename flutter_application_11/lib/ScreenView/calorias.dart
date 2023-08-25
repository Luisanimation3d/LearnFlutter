import 'package:flutter/material.dart';
import 'package:flutter_application_11/Components/dropDown.dart';
import 'package:flutter_application_11/Components/input.dart';

final TextEditingController desayunoController = TextEditingController();
final TextEditingController comidaController = TextEditingController();
final TextEditingController cenaController = TextEditingController();
final TextEditingController genderController = TextEditingController();
double calorias = 0;

class CaloriasViewComponent extends StatefulWidget {
  const CaloriasViewComponent({super.key});

  @override
  State<CaloriasViewComponent> createState() => _CaloriasViewComponentState();
}

class _CaloriasViewComponentState extends State<CaloriasViewComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calorias'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
              child: Column(
            children: [
              InputComponent(label: 'Calorias consumidas en el desayuno', controller: desayunoController, keyboardType: TextInputType.number),
              const SizedBox(height: 10),
              InputComponent(label: 'Calorias consumidas en la comida', controller: comidaController, keyboardType: TextInputType.number),
              const SizedBox(height: 10),
              InputComponent(label: 'Calorias consumidas en la cena', controller: cenaController, keyboardType: TextInputType.number),
              const SizedBox(height: 10),
              DropDownComponent(value: 'Mujer', items: const [
                'Mujer',
                'Hombre'
              ], onChanged: (value) {
                setState(() {
                  genderController.text = value!;
                });
              }),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: (){
                setState(() {
                  calorias = double.parse(desayunoController.text) + double.parse(comidaController.text) + double.parse(cenaController.text);
                });
              }, child: const Text('Mostrar resultado')),
              const SizedBox(height: 10),
              Text(genderController.text == 'Mujer' ? calorias < 1600 ? 'Deficit calórico'  : (calorias >= 1600 && calorias < 2000) ? 'Consumo normal' : 'Consumo excesivo de calorías' : calorias < 2000 ? 'Deficit calórico'  : (calorias >= 2000 && calorias < 2500) ? 'Consumo normal' : 'Consumo excesivo de calorías'),
            ],
          )),
        ),
      ),
    );
  }
}
