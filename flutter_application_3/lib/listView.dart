import 'package:flutter/material.dart';

List<String> list = ['Map', 'Operative System', 'File'];
List<IconData> icons = [Icons.map, Icons.computer, Icons.folder];
List<Color> colors = [Colors.blue, Colors.red, Colors.green];

class listView extends StatelessWidget {
  const listView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView'),
        ),
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(icons[index], color: colors[index]),
              title: Text(list[index], style: TextStyle(color: colors[index]),),
              onTap: () => {
                print('Tapped on ' + list[index])
              },
            );
          },
        ));
  }
}
