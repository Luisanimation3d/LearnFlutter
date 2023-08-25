import 'package:flutter/material.dart';
import 'package:flutter_application_11/Components/input.dart';

class ContactoViewComponent extends StatefulWidget {
  const ContactoViewComponent({super.key});

  @override
  State<ContactoViewComponent> createState() => _ContactoViewComponentState();
}

class _ContactoViewComponentState extends State<ContactoViewComponent> {
    final TextEditingController nombreController = TextEditingController();
    final TextEditingController correoController = TextEditingController();
    final TextEditingController numeroController = TextEditingController();
    String mensaje = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: SingleChildScrollView(
          child: Form(
              child: Column(
            children: [
              InputComponent(label: 'Correo electrónico', controller: correoController, keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 20),
              InputComponent(label: 'Nombre', controller: nombreController, keyboardType: TextInputType.name),
              const SizedBox(height: 20),
              InputComponent(label: 'Número de teléfono', controller: numeroController, keyboardType: TextInputType.phone),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                setState(() {
                  mensaje = 'Mensaje enviado con éxito';
                });
              }, child: const Text('Enviar')),
              const SizedBox(height: 20),
              Text(mensaje)
            ],
          )),
        )),
      ),
    );
  }
}
