import 'package:flutter/material.dart';
import 'package:prueba_01/screens/Ejercicio01.dart';
import 'package:prueba_01/screens/Ejercicio02.dart';

void main() {
  runApp(Prueba());
}

class Prueba extends StatelessWidget {
  const Prueba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Prueba",
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
  int indice = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Body(context),
      Ejercicio01(),
      Ejercicio02(),
      Boton1(context),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba'),
      ),
      body: screens[indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: (valor) {
          setState(() {
            indice = valor;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(
              icon: Icon(Icons.draw_sharp), label: "Ejercicio 01"),
          BottomNavigationBarItem(
              icon: Icon(Icons.draw_sharp), label: "Ejercicio 02"),
        ],
      ),
    );
  }
}

Widget Body(BuildContext context) {
  return Stack(
    fit: StackFit.expand,
    children: <Widget>[
      Image.network(
        "https://c4.wallpaperflare.com/wallpaper/760/459/710/aoi-ogata-anime-girls-wallpaper-preview.jpg",
        fit: BoxFit.cover,
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "David Chicaiza",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Daxel20",
              style: TextStyle(color: Colors.white),
            ),
            Boton1(context),
          ],
        ),
      ),
    ],
  );
}

Widget Boton1(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      mostrarAlerta01(context).then((confirmed) {
        if (confirmed) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Ejercicio02()),
          );
        }
      });
    },
    child: Text("Ir al Ejercicio02"),
  );
}

mostrarAlerta01(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("¿Está seguro de ir al ejercicio 2?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, true); 
            },
            child: Text("Sí"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text("No"),
          ),
        ],
      );
    },
  );
}
