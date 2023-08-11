import 'package:flutter/material.dart';

class Listas extends StatelessWidget {
  const Listas({super.key});

  @override
  Widget build(BuildContext context) {
    List usuarios = [
      {'nombre': 'Pepe', 'apellido': 'Perez', 'estado': 'Activo', 'img':'https://cdn.pixabay.com/photo/2016/09/28/08/28/art-1699977_640.jpg'},
      {'nombre': 'Lucas', 'apellido': 'Perez', 'estado': 'Activo', 'img':'https://cdn.pixabay.com/photo/2016/09/28/08/28/art-1699977_640.jpg'},
      {'nombre': 'Marcela', 'apellido': 'Villareal', 'estado': 'Activo', 'img':'https://cdn.pixabay.com/photo/2020/09/18/05/58/lights-5580916_1280.jpg'},
      {'nombre': 'Camila', 'apellido': 'Castro', 'estado': 'Inactivo' , 'img':'https://cdn.pixabay.com/photo/2020/09/18/05/58/lights-5580916_1280.jpg' },
      {'nombre': 'Diego', 'apellido': 'Granda', 'estado': 'Activo', 'img':'https://cdn.pixabay.com/photo/2016/09/28/08/28/art-1699977_640.jpg'},
      {'nombre': 'Ricardo', 'apellido': 'Acevedo', 'estado': 'Inactivo', 'img':'https://cdn.pixabay.com/photo/2016/09/28/08/28/art-1699977_640.jpg'},
    ];
    return Scaffold(
      body: ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${index + 1} ${usuarios[index]['nombre']} ${usuarios[index]['apellido']}',
                style: const TextStyle(fontSize: 25),
              ),
              Text(
                '${usuarios[index]['estado']}',
                style: TextStyle(
                    fontSize: 25,
                    color: usuarios[index]['estado'] == 'Activo'
                        ? Colors.green
                        : Colors.red),
              ),
              /* Image.network(usuarios[index]['img'], width: 40,) */
              Image.asset('assets/img/bulldog.jpg', width: 40,)
            ],
          );
        },
      ),
    );
  }
}
