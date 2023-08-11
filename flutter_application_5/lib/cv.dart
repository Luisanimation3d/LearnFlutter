import 'package:flutter/material.dart';

class cv extends StatelessWidget {
  const cv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(
          child: Text("Curriculum Vitae"),
        )),
        body: Center(
          child: ListView(padding: const EdgeInsets.all(8), children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 10,
                        ),
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.network(
                            'https://images.unsplash.com/photo-1617130094141-532436117aa1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80',
                            width: 150,
                            height: 150),
                      )),
                ),
                SizedBox(height: 25),
                const Text(
                  'Luis Angel Correa',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                const ExpansionTile(
                  title: Text('Información Personal'),
                  leading: Icon(Icons.person),
                  collapsedBackgroundColor: Color.fromARGB(255, 216, 227, 232),
                  backgroundColor: Color.fromARGB(255, 216, 227, 232),
                  children: [
                    Card(
                      child: ListTile(
                        title: Text('Nombre: Luis Angel Correa'),
                        leading: Icon(Icons.person),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Edad: 21 Años'),
                        leading: Icon(Icons.calendar_month),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Dirección: Calle 5 # 5-5'),
                        leading: Icon(Icons.home),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Telefóno: 311 111 1111'),
                        leading: Icon(Icons.phone),
                      ),
                    ),
                    Card(
                        child: ListTile(
                      title: Text('Correo: luisangelcorreadev@gmail.com'),
                      leading: Icon(Icons.email),
                    )),
                    Card(
                        child: ListTile(
                      title: Text('Ciudad: Medellín'),
                      leading: Icon(Icons.location_city),
                    )),
                  ],
                ),
                SizedBox(height: 10),
                const ExpansionTile(
                  title: Text('Formación Académica'),
                  leading: Icon(Icons.school),
                  collapsedBackgroundColor: Color.fromARGB(255, 216, 227, 232),
                  backgroundColor: Color.fromARGB(255, 216, 227, 232),

                  children: [
                    Card(
                      child: ListTile(
                        title: Text('Técnico en Desarrollo de Software'),
                        subtitle: Text('2018 - 2019'),
                        leading: Icon(Icons.school),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Tecnólogo: Análisis y Desarrollo de Software'),
                        subtitle: Text('2022 - actualidad'),
                        leading: Icon(Icons.school),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                const ExpansionTile(
                  title: Text('Habilidades'),
                  leading: Icon(Icons.star),
                  collapsedBackgroundColor: Color.fromARGB(255, 216, 227, 232),
                  backgroundColor: Color.fromARGB(255, 216, 227, 232),
                  children: [
                    Card(
                      child: ListTile(
                        title: Text('HTML'),
                        leading: Icon(Icons.star),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('CSS'),
                        leading: Icon(Icons.star),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('JavaScript'),
                        leading: Icon(Icons.star),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('TypeScript'),
                        leading: Icon(Icons.star),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Java'),
                        leading: Icon(Icons.star),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('C#'),
                        leading: Icon(Icons.star),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('ReactJs'),
                        leading: Icon(Icons.star),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('React Native'),
                        leading: Icon(Icons.star),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('PHP'),
                        leading: Icon(Icons.star),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Flutter'),
                        leading: Icon(Icons.star),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Dart'),
                        leading: Icon(Icons.star),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                const ExpansionTile(
                  title: Text('Experiencia Laboral'),
                  leading: Icon(Icons.work),
                  collapsedBackgroundColor: Color.fromARGB(255, 216, 227, 232),
                  backgroundColor: Color.fromARGB(255, 216, 227, 232),
                  children: [
                    Card(
                      child: ListTile(
                        title: Text('Desarrollador Front End'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ecomsur'),
                            Text('2022 - 2023'),
                          ],
                        ),

                        leading: Icon(Icons.work),
                      ),
                    ),
                  ],
                ),
              ]
            )
          ]),
        ));
  }
}
