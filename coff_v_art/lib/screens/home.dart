import 'package:coff_v_art/components/menu.dart';
import 'package:coff_v_art/screens/Module1/roles/get_roles.dart';
import 'package:coff_v_art/screens/login.dart';
import 'package:flutter/material.dart';

class HomeViewComponent extends StatelessWidget {
  const HomeViewComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
      ),
      body: const Center(
        child: MenuAppComponent(
          items: [
            {
              'title': 'Roles',
              'icon': Icons.person,
              'route': GetRoles()
            }
          ],
        )
      ),
    );
  }
}