import 'dart:convert';
import 'package:coff_v_art/components/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:coff_v_art/models/data_model.dart';

class GetRoles extends StatefulWidget {
  const GetRoles({Key? key}) : super(key: key);

  @override
  State<GetRoles> createState() => _GetRolesState();
}

class _GetRolesState extends State<GetRoles> {
  bool _isLoading = false;
  int idContador = 1;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  DataModel? _dataModel;
  _getData() async {
    try {
      String url = 'https://coff-v-art-api.onrender.com/api/roles';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        _dataModel = DataModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text('Dropdown con API'))),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : DataTable(
              clipBehavior: Clip.antiAlias,
                columns: const [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Nombre')),
                    DataColumn(label: Text('Estado')),
                  ],
                rows: _dataModel!.roles
                    .map((rol) => DataRow(cells: [
                          DataCell(Text('${idContador++}')),
                          DataCell(Text(rol.name)),
                          DataCell(Text(rol.state ? 'Activo' : 'Inactivo')),
                        ]))
                    .toList()));
  }
}
