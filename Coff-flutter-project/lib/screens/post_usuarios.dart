import 'dart:async';
import 'dart:convert';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:coff_v_art/components/input.dart';
import 'package:http/http.dart' as http;

// Importa el modelo de datos de Usuario
import 'package:coff_v_art/models/usuarios.dart';

Future<Usuario> createUsuario(Map<String, dynamic> usuario) async {
  try {
    final response = await http.post(
      Uri.parse('https://coff-v-art-api.onrender.com/api/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': usuario['name'],
        'tel': usuario['tel'],
        'email': usuario['email'],
        'password': usuario['password'],
        'rol': usuario['rol'],
      }),
    );

    if (response.statusCode == 201) {
      final nuevoUsuario = Usuario.fromJson(jsonDecode(response.body));
      return nuevoUsuario;
    } else {
      throw Exception(response.body);
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

class CreateUsuarioViewComponent extends StatefulWidget {
  CreateUsuarioViewComponent({Key? key}) : super(key: key);

  @override
  State<CreateUsuarioViewComponent> createState() =>
      _CreateUsuarioViewComponentState();
}

class _CreateUsuarioViewComponentState
    extends State<CreateUsuarioViewComponent> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rolController = TextEditingController();

  Future<Usuario>? _futureUsuario;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: (_futureUsuario == null) ? _form() : _futureBuilder(),
    );
  }

  FutureBuilder<Usuario> _futureBuilder() {
    return FutureBuilder<Usuario>(
      future: _futureUsuario,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Usuario creado correctamente',
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _futureUsuario = null;
                  });
                },
                child: const Text('Crear otro usuario'),
              ),
            ],
          );
        }
        ;
        return const CircularProgressIndicator();
      },
    );
  }

  Form _form() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InputComponent(
            label: 'Nombre',
            controller: _nameController,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese un nombre';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InputComponent(
            label: 'Teléfono',
            controller: _telController,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese un teléfono';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InputComponent(
            label: 'Email',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese un email';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InputComponent(
            label: 'Password',
            controller: _passwordController,
            obscureText: true,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese un password';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InputComponent(
            label: 'Rol',
            controller: _rolController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese un rol';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  _futureUsuario = createUsuario({
                    'name': _nameController.text,
                    'tel': _telController.text,
                    'email': _emailController.text,
                    'password': _passwordController.text,
                    'rol': _rolController.text,
                  });
                });
                const Text('Usuario creado correctamente');
              }
            },
            child: const Text('Crear Usuario'),
          ),
        ],
      ),
    );
  }
}
