import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_14/models/models.dart';

import 'package:http/http.dart' as http;

class GetUsersView extends StatefulWidget {
  const GetUsersView({Key? key}) : super(key: key);

  @override
  State<GetUsersView> createState() => _GetUsersViewState();
}

class _GetUsersViewState extends State<GetUsersView> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  DataModel? _dataModel;
  _getUserData() async {
    try {
      String url = 'https://coff-v-art-api.onrender.com/api/user';
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
      body: _isLoading ? 
      const Center(child: CircularProgressIndicator()) :
      ListView.builder(
        itemCount: _dataModel!.users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_dataModel!.users[index].name),
            subtitle: Text(_dataModel!.users[index].email),
          );
        },
      ),
    );
  }
}
