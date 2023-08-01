import 'dart:io';

import 'jugador.dart';

class Agencia {
  String nombre;
  int idJugador;
  int salario;

  Agencia(this.nombre, this.idJugador, this.salario);

  static List<Agencia> jugadoresContratados = [];

  static contratarJugador(int id){
    print('Ingree nombre de la agencia');
    String nombre = stdin.readLineSync()!;
    print('Ingree el salario');
    int salario= int.parse(stdin.readLineSync()!);
    jugadoresContratados.add(Agencia(nombre, id, salario));
    print('Jugador contratado');
  }

  static jugadoresContratos(){
    if (jugadoresContratados.isEmpty) {
      print('No hay jugadores contratados');
    } else {
      for (var j in jugadoresContratados) {

        print('Nombre: ${j.nombre} - Id: ${j.idJugador} ${Jugador.jugadores.firstWhere((element) => element.id == j.idJugador)}- Salario: ${j.nombre}');
      }      
    }
  }

}