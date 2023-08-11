import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi aplicación'),
      ),
      drawer: const Drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Hola, Flutter',
                  style: TextStyle(color: Color.fromARGB(255, 55, 69, 145), fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Borel'),
                ),
                Text(
                  'Bienvenido',
                  style: TextStyle(color: Color.fromARGB(255, 55, 69, 145), fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Borel'),
                ),
              ],
            ),
            const Text('Otro texto'),
            SizedBox(height: 70,),
            Container(
              width: 280,
              height: 280,
              color: Colors.amber,
              child: const Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Contenedor1 '),
                  Text('Contenedor1 '),
                ],
              )),
            )
          ],
        ),        
      ),
    );
  }
}
