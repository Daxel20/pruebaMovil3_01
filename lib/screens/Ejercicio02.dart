import 'package:flutter/material.dart';

void main() {
  runApp(Ejercicio02());
}

class Ejercicio02 extends StatelessWidget {
  const Ejercicio02({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejercicio 02'),
        ),
        body: Stack(
          children:<Widget> [
            // Imagen de fondo
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://c4.wallpaperflare.com/wallpaper/410/867/750/vector-forest-sunset-forest-sunset-forest-wallpaper-preview.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Contenido centrado
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.black54,
                child: CarruselCalculadora(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarruselCalculadora extends StatefulWidget {
  const CarruselCalculadora({Key? key}) : super(key: key);

  @override
  _CarruselCalculadoraState createState() => _CarruselCalculadoraState();
}

class _CarruselCalculadoraState extends State<CarruselCalculadora> {
  final TextEditingController _velocidadController = TextEditingController();
  double _distanciaRecorrida = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _velocidadController,
          decoration: InputDecoration(labelText: 'Velocidad angular (rad/s)'),
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            calcularDistancia();
          },
          child: Text('Calcular distancia'),
        ),
        SizedBox(height: 20),
        Text(
          'Distancia recorrida: $_distanciaRecorrida rad',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    );
  }

  void calcularDistancia() {
    double velocidadAngular = double.tryParse(_velocidadController.text) ?? 0.0;
    double tiempo = 25; 
    double distanciaRecorrida = velocidadAngular * tiempo;
    setState(() {
      _distanciaRecorrida = distanciaRecorrida;
    });
  }
}
