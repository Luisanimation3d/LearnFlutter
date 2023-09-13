import 'dart:convert';
import 'package:coff_v_art/screens/post_usuarios.dart';
import 'package:coff_v_art/screens/put_usuario.dart';
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

  _deleteUsuario(String id) async {
    try {
      String url = 'https://coff-v-art-api.onrender.com/api/user/$id';
      http.Response res = await http.delete(Uri.parse(url));
      if (res.statusCode == 200) {
        _getUsuarios();
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
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        _getUsuarios();
                      },
                      child: const Text('Refrescar'),
                    ),
                    const SizedBox(height: 24.0),
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
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child: AlertDialog(
                                                title: const Center(
                                                    child:
                                                        Text("Crear usuario")),
                                                content: Column(children: [
                                                  UpdateUsuarioViewComponent(
                                                      usuario: usuario)
                                                ]),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {});
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Cerrar'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: const Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child: AlertDialog(
                                                title: const Center(
                                                    child: Text(
                                                        "Eliminar usuario")),
                                                content: Column(children: [
                                                  Text(
                                                      "¿Está seguro que desea eliminar el usuario ${usuario.name}?")
                                                ]),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      _deleteUsuario(
                                                          usuario.id);
                                                      setState(() {});
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child:
                                                        const Text('Eliminar'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {});
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Cerrar'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
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
