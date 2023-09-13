import 'package:coff_v_art/screens/index.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    // Simular una carga con un retraso (5 segundos) y luego redirigir
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        // Comprobar si el widget está montado antes de redirigir
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HelloWorldView()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo de imagen
          Image.asset(
            '../assets/granos.jpg', // Ruta de la imagen de fondo
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5), // Opacidad del 50%
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bienvenido A\n  Coff-v-art',
                  style: TextStyle(
                    fontSize: 36.0, // Tamaño de fuente más grande
                    color: Colors.white, // Texto en color blanco
                  ),
                ),
                const SizedBox(height: 24.0),
                ClipOval(
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(0, 255, 255, 255),
                        width: 2.0, // Ancho del borde
                      ),
                    ),
                    child: Image.asset(
                      '../assets/burdeo.jpg',
                      width: 90.0,
                      height: 90.0,
                      fit: BoxFit.cover, // Ajustar la imagen al círculo
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
