import 'package:flutter/material.dart';

class Botones extends StatefulWidget {
  const Botones({super.key});

  @override
  State<Botones> createState() => _BotonesState();
}

class _BotonesState extends State<Botones> {

  String mensaje = ''; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              setState(() {
                mensaje = 'Boton presionado';                
              });
            }, child: Text('Presiona aquí'),),
            Text(mensaje)
          ],
        ),
      ),
    );
  }
}