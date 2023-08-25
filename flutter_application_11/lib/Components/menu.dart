import 'package:flutter/material.dart';

class MenuAppComponent extends StatelessWidget {
  const MenuAppComponent({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var item in items)
          ListTile(
            leading: Icon(item['icon']),
            title: Text(item['title']),
            // When the user taps the button, navigate to a named route and changed the screen.
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => item['route']));
            },
          ),
      ],
    );
  }
}