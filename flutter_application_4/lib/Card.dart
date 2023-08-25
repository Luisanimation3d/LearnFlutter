import 'package:flutter/material.dart';
import 'package:flutter_application_4/SecondView.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Card'),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              // Put a menu option on the right
              child: ListTile(
                // leading: FlutterLogo(size: 56.0),
                leading: Image.network('https://picsum.photos/250?image=9'),
                title: const Text('One-line with leading widget'),
                subtitle: const Text('Here is a second line'),
                // put an image on the card
                // trailing: Image.network('https://picsum.photos/250?image=9'),
                trailing: PopupMenuButton(
                  itemBuilder:  (context) => [
                    const PopupMenuItem(
                      child: const Text('View'),
                      value: 'view',
                    ),
                    const PopupMenuItem(
                      child: const Text('Edit'),
                      value: 'edit',
                    ),
                    const PopupMenuItem(
                      child: const Text('Delete'),
                      value: 'delete',
                    ),
                  ],
                  onSelected: (value) {
                    switch (value) {
                      case 'view':
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondView()));
                        break;
                      case 'edit':
                        break;
                      case 'delete':
                        break;
                    }
                  },
                ),
                isThreeLine: false,
                : () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondView()))
              ),
            ),
          ],
        ),
      ),
    );
  }
}