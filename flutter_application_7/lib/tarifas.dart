import 'package:flutter/material.dart';

class Tarifa extends StatefulWidget {
  const Tarifa({super.key});

  @override
  State<Tarifa> createState() => _TarifaState();
}

class _TarifaState extends State<Tarifa> {
  String dropdownValue = 'Desarrollo web';
  List <String> servicio = ['Desarrollo web','Desarrollo móvil','Mantenimiento','Bases de datos','Cursos de formación'];
  List <String> descripcion = ['Aplicaciones','App','Hardware, software','SQL','Cursos'];
  List <double> valor = [5000.000,3000.000,1500.000,3500.000,1000.000];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarifas'),
      ),
      
      body:Container(
            padding:const EdgeInsets.all(5),
            child: Column(
              children:[DropdownButton<String>(
                value: dropdownValue,
                items:servicio.map<DropdownMenuItem<String>>(
                  (String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 25),
                        ),
                    );
                  }).toList(),
                onChanged: (String? newValue){
                  setState(() {
                    dropdownValue = newValue!;
                    print(newValue);
                    
                    for (int i = 0; i < servicio.length; i++) {
                      if(servicio == 'Desarrollo web'){
                        descripcion[i] = 'Aplicaciones';
                      }else if ()
                    }
                  });
                },
              ),
              ]
            ),
              )
            );
  }
}