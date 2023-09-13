import 'dart:convert';
import 'package:coff_v_art/screens/post_usuarios.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:coff_v_art/Models/usuarios.dart';

class ListUsuariosViewComponent extends StatefulWidget {
  const ListUsuariosViewComponent({super.key});

  @override
  State<ListUsuariosViewComponent> createState() =>
      ListUsuariosViewComponentState();
}

class ListUsuariosViewComponentState extends State<ListUsuariosViewComponent> {
  bool _isloading = false;

  @override
  void initState() {
    super.initState();
    _getUsuarios();
  }

  DataModelUsuario? _dataModelUsuario;

  _getUsuarios() async {
    _isloading = true;
    try {
      String url = 'https://coff-v-art-api.onrender.com/api/user';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        _dataModelUsuario = DataModelUsuario.fromJson(json.decode(res.body));
        _isloading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuarios'),
      ),
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
            child: Column(
                children: [
                  DataTable(
                    columns: const [
                      DataColumn(label: Text('Nombre')),
                      DataColumn(label: Text('Teléfono')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Rol')),
                      DataColumn(label: Text('Acciones')),
                    ],
                    rows: _dataModelUsuario!.usuarios
                        .map((usuario) => DataRow(cells: [
                              DataCell(Text(usuario.name)),
                              DataCell(Text(usuario.tel)),
                              DataCell(Text(usuario.email)),
                              DataCell(Text(usuario.rol)),
                              DataCell(Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ))
                            ]))
                        .toList(),
                  ),
                ],
              ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: AlertDialog(
                  title: const Center(child: Text("Crear usuario")),
                  content: Column(children: [CreateUsuarioViewComponent()]),
                  actions: [
                    TextButton(
                      onPressed: () {
                        setState(() {});
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cerrar'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
