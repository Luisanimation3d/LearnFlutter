import 'dart:async';
import 'dart:convert';
// import 'package:dio/dio.dart';
import 'package:coff_v_art/components/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:coff_v_art/components/input.dart';
import 'package:http/http.dart' as http;

// Importa el modelo de datos de Usuario
import 'package:coff_v_art/models/usuarios.dart';
import 'package:coff_v_art/models/roles.dart';

Future<Usuario> updateUsuario(Map<String, dynamic> usuario) async {
  try {
    final response = await http.put(
      Uri.parse(
          'https://coff-v-art-api.onrender.com/api/user/${usuario['_id']}'),
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

class UpdateUsuarioViewComponent extends StatefulWidget {
  UpdateUsuarioViewComponent({Key? key, required usuario}) : super(key: key);

  @override
  State<UpdateUsuarioViewComponent> createState() =>
      _UpdateUsuarioViewComponentState();
}

class _UpdateUsuarioViewComponentState
    extends State<UpdateUsuarioViewComponent> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rolController = TextEditingController();

  bool _isloading = false;
  @override
  void initState() {
    super.initState();
    _nameController.text = widget.usuario.name;
    _telController.text = widget.usuario.tel;
    _emailController.text = widget.usuario.email;
    _passwordController.text = widget.usuario.password;
    _rolController.text = widget.usuario.rol;
    _getRoles();
  }

  DataModelRol? _dataModelRol;

  _getRoles() async {
    _isloading = true;
    try {
      String url = 'https://coff-v-art-api.onrender.com/api/roles';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        _dataModelRol = DataModelRol.fromJson(json.decode(res.body));
        _isloading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

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
            value: _nameController.text,
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
            value: _telController.text,
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
            value: _emailController.text,
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
          DropDownComponent(
            value: _rolController.text,
            items: _dataModelRol!.roles
                    .map((e) => e.name.isEmpty ? '' : e.name)
                    .toList() ??
                [''],
            onChanged: (value) {
              _rolController.text = value!;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  _futureUsuario = updateUsuario({
                    'name': _nameController.text,
                    'tel': _telController.text,
                    'email': _emailController.text,
                    'password': _passwordController.text,
                    'rol': _rolController.text,
                  });
                });
                const Text('Usuario creado correctamente');
                Navigator.of(context).pop();
              }
            },
            child: const Text('Crear Usuario'),
          ),
        ],
      ),
    );
  }
}
