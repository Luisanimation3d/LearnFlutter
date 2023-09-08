import 'package:coff_v_art/components/input.dart';
import 'package:flutter/material.dart';

class LoginViewComponent extends StatefulWidget {
  const LoginViewComponent({Key? key}) : super(key: key);

  @override
  State<LoginViewComponent> createState() => _LoginViewComponentState();
}

class _LoginViewComponentState extends State<LoginViewComponent> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey =
      GlobalKey<FormState>(); // Agregar una clave global para el formulario

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey, // Asociar el formulario con la clave global
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset('../assets/burdeo_logo.png'),
              const SizedBox(height: 16.0),
              InputComponent(
                label: 'Correo Electrónico',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese su correo electrónico';
                  } else if (!value.contains('@')) {
                    return 'Por favor ingrese un correo electrónico válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              InputComponent(
                label: 'Contraseña',
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese su contraseña';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Usar currentState para acceder al estado del formulario
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Procesando datos')),
                    );
                  }
                },
                child: const Text('Ingresar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
