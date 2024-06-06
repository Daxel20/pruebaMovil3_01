import 'package:flutter/material.dart';

void main() {
  runApp(Ejercicio01());
}

class Ejercicio01 extends StatelessWidget {
  const Ejercicio01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _alturaInicialController = TextEditingController();
  final TextEditingController _tiempoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 01'),
      ),
      body: Stack(
        children: <Widget>[
          Image.network(
            "https://c4.wallpaperflare.com/wallpaper/966/951/802/digital-digital-art-artwork-illustration-fantasy-art-hd-wallpaper-preview.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.black54,
              child: Cuerpo(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget Cuerpo(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Lanzamiento de Cohete",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        CampoAlturaInicial(),
        SizedBox(height: 10),
        CampoTiempo(),
        SizedBox(height: 20),
        BotonLanzar(context),
      ],
    );
  }

  Widget CampoAlturaInicial() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _alturaInicialController,
        decoration: InputDecoration(
          hintText: "Altura Inicial (metros)",
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget CampoTiempo() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _tiempoController,
        decoration: InputDecoration(
          hintText: "Tiempo (segundos)",
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget BotonLanzar(context) {
    return ElevatedButton(
      onPressed: () {
        alertResultado(context);
      },
      child: Text("Lanzar Cohete"),
    );
  }

  void alertResultado(context) {
    double alturaInicial = double.tryParse(_alturaInicialController.text) ?? 0.0;
    double tiempo = double.tryParse(_tiempoController.text) ?? 0.0;
    double alturaAlcanzada = alturaInicial + 0.5 * 20 * tiempo * tiempo;
    String mensaje;
    if (alturaAlcanzada >= 1000) {
      mensaje = "El lanzamiento fue exitoso. Altura alcanzada: $alturaAlcanzada metros.";
    } else {
      mensaje = "El lanzamiento ha fallado. Altura alcanzada: $alturaAlcanzada metros.";
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Resultado del Lanzamiento"),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cerrar"),
            )
          ],
        );
      },
    );
  }
}
