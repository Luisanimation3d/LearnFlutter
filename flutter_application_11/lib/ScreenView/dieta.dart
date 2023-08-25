import 'package:flutter/material.dart';

class DietaViewComponent extends StatelessWidget {
  const DietaViewComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dieta'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text('Dieta para el desayuno', style: TextStyle(fontSize: 24)),
                SizedBox(height: 10),
                Image.network('https://images.unsplash.com/photo-1620146344904-097a0002d797?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80'),
                SizedBox(height: 10),
                const Text('-pan integral con palta \n -café con leche o té/anís', style: TextStyle(fontSize: 16),),
                SizedBox(height: 10),
                const Text('Dieta para el Mediodía', style: TextStyle(fontSize: 24)),
                SizedBox(height: 10),
                Image.network('https://images.unsplash.com/photo-1467453678174-768ec283a940?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1444&q=80'),
                SizedBox(height: 10),
                const Text('-frutas \n -Agua o té', style: TextStyle(fontSize: 16),),
                SizedBox(height: 10),
                const Text('Dieta para la Comida', style: TextStyle(fontSize: 24)),
                SizedBox(height: 10),
                Image.network('https://images.unsplash.com/photo-1524859330668-c357331384f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1476&q=80'),
                SizedBox(height: 10),
                const Text('-ensalada de verduras \n -pollo o carne \n -arroz o fideos', style: TextStyle(fontSize: 16),),
                SizedBox(height: 10),
                const Text('Dieta para la Merienda', style: TextStyle(fontSize: 24)),
                SizedBox(height: 10),
                Image.network('https://images.unsplash.com/photo-1628692945318-f44a3c346afb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80'),
                SizedBox(height: 10),
                const Text('-frutas \n -Agua o té', style: TextStyle(fontSize: 16),),
                SizedBox(height: 10),
                const Text('Dieta para la Cena', style: TextStyle(fontSize: 24)),
                SizedBox(height: 10),
                Image.network('https://images.unsplash.com/photo-1556911073-38141963c9e0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80'),
                SizedBox(height: 10),
                const Text('-ensalada de verduras \n -pollo o carne \n -arroz o fideos', style: TextStyle(fontSize: 16),),
              ],
            ),
          ),
        )
    );
  }
}