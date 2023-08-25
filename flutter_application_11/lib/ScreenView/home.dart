import 'package:flutter/material.dart';
import 'package:flutter_application_11/Components/menu.dart';
import 'package:flutter_application_11/ScreenView/calorias.dart';
import 'package:flutter_application_11/ScreenView/contacto.dart';
import 'package:flutter_application_11/ScreenView/dieta.dart';
import 'package:flutter_application_11/ScreenView/imc.dart';
import 'package:flutter_application_11/ScreenView/rutinas.dart';
import 'package:flutter_application_11/ScreenView/presion.dart';

class HomeViewComponent extends StatefulWidget {
  const HomeViewComponent({super.key});

  @override
  State<HomeViewComponent> createState() => _HomeViewComponentState();
}

class _HomeViewComponentState extends State<HomeViewComponent> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'icon': Icons.compress_outlined,
        'title': 'Dieta',
        'route': const DietaViewComponent(),
      },
      {
        'icon': Icons.calculate_outlined,
        'title': 'IMC',
        'route': const IMCViewComponent(),
      },
      {
        'icon': Icons.food_bank_outlined,
        'title': 'Calorias',
        'route': const CaloriasViewComponent(),
      },
      {
        'icon': Icons.fitness_center_outlined,
        'title': 'Rutinas de ejercicio',
        'route': const RutinasViewComponent(),
      },
      {
        'icon': Icons.water_damage_outlined,
        'title': 'Presión Arterial',
        'route': const PersionArtetialViewComponent(),
      },
      {
        'icon': Icons.info_outline,
        'title': 'Contacto',
        'route': const ContactoViewComponent(),
      }
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: MenuAppComponent(items: items),
              ),
              const Text('Vida Saludable', style: TextStyle(fontSize: 24)),
              const SizedBox(height: 10,),
              Image.network('https://images.unsplash.com/photo-1549890762-0a3f8933bc76?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1568&q=80')
            ],
          ),
        ));
  }
}
