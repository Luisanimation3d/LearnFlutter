import 'package:flutter/material.dart';

class Ambiente extends StatefulWidget {
  const Ambiente({super.key});

  @override
  State<Ambiente> createState() => _AmbienteState();
}

class _AmbienteState extends State<Ambiente> {
  String dropdownValue = '801';
  List <String> opciones = ['801','802','803','804','805'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ambientes de formación'),
      ),
      body:Container(
            padding:const EdgeInsets.all(5),
            child: Column(
              children:[DropdownButton<String>(
                value: dropdownValue,
                items:opciones.map<DropdownMenuItem<String>>(
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
                  });
                },
              ),
              ]
            ),
              )
            );
  }
}