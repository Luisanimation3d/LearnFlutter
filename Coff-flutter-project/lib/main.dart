import 'package:coff_v_art/screens/get_usuarios.dart';
import 'package:coff_v_art/screens/post_usuarios.dart';
import 'package:coff_v_art/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginViewComponent(),
      // home: CreateUsuarioViewComponent(),
      // home: ListUsuariosViewComponent(),
      debugShowCheckedModeBanner: false,
    );
  }
}
