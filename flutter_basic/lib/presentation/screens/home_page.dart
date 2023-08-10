import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi aplicación'),
      ),
      drawer: Drawer(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
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
            Text('Otro texto')
          ],
        ),        
      ),
    );
  }
}
