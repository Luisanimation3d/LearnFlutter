import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_13/components/dropdown.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_13/models/data_model.dart';

class Get extends StatefulWidget {
  const Get({Key? key}) : super(key: key);

  @override
  State<Get> createState() => _GetState();
}

class _GetState extends State<Get> {
  bool _isLoading = false;

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
        body: _isLoading ? const Center(child: CircularProgressIndicator())
            // : ListView.builder(
            //     itemCount: _dataModel!.roles.length,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         // child: Card(
            //         //   child: ListTile(
            //         //     title: Text(_dataModel!.roles[index].name),
            //         //     subtitle: Text(_dataModel!.roles[index].state
            //         //         ? 'Activo'
            //         //         : 'Inactivo'),
            //         //     onTap: () => {
            //         //       showDialog(
            //         //         context: context,
            //         //         builder: (BuildContext context) {
            //         //           return AlertDialog(
            //         //             title: Center(child: Text(_dataModel!.roles[index].name)),
            //         //             content: Text(_dataModel!.roles[index].permissions.toString()),
            //         //           );
            //         //         },
            //         //       )
            //         //     },
            //         //   ),
            //         // ),
            //       );
            //     },
            //   ),
            : Column(
                children: [
                  DropDownComponent(
                      items: _dataModel!.roles
                          .map((role) => role.name.isEmpty ? '' : role.name)
                          .toList(), 
                      onChanged: (value) => debugPrint(value.toString())),
                ],
              ));
  }
}
