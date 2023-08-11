import 'package:flutter/material.dart';

class productGrid extends StatefulWidget {
  const productGrid({super.key});

  @override
  State<productGrid> createState() => _productGridState();
}

class _productGridState extends State<productGrid> {
  // Array to save image from web
  List<Image> productImage = List.from([
    Image.network(
        'https://images.unsplash.com/photo-1525351326368-efbb5cb6814d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80',
        width: 350),
    Image.network(
        'https://images.unsplash.com/photo-1600354587397-681c16c184bf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80',
        width: 350),
    Image.network(
        'https://images.unsplash.com/photo-1597589827317-4c6d6e0a90bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80',
        width: 350),
    Image.network(
        'https://images.unsplash.com/photo-1525351326368-efbb5cb6814d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80',
        width: 350),
    Image.network(
        'https://images.unsplash.com/photo-1600354587397-681c16c184bf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80',
        width: 350),
    Image.network(
        'https://images.unsplash.com/photo-1597589827317-4c6d6e0a90bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80',
        width: 350),
    Image.network(
        'https://images.unsplash.com/photo-1525351326368-efbb5cb6814d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80',
        width: 350),
    Image.network(
        'https://images.unsplash.com/photo-1600354587397-681c16c184bf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80',
        width: 350),
    Image.network(
        'https://images.unsplash.com/photo-1597589827317-4c6d6e0a90bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80',
        width: 350),
    Image.network(
        'https://images.unsplash.com/photo-1525351326368-efbb5cb6814d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80',
        width: 350),
  ]);

  List<String> productTitle = List.from([
    'Product 1',
    'Product 2',
    'Product 3',
    'Product 4',
    'Product 5',
    'Product 6',
    'Product 7',
    'Product 8',
    'Product 9',
    'Product 10',
  ]);

  List<int> productPrice = List.from([
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    1000,
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Grid'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        scrollDirection: Axis.vertical,
        // children: ,
        // en un ciclo imprimir cartas de producto
        children: [
          for (var i = 0; i < productImage.length; i++)
            Card(
              child: Column(
                children: [
                  productImage[i],
                  ListTile(
                    title: Center(child: Text(productTitle[i])),
                    subtitle: Center(child: Text('Price: \$${productPrice[i]}')),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
