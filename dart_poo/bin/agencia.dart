import 'dart:io';

class Agencia {
  String nombre;
  int idJugador;
  int salario;

  Agencia(this.nombre, this.idJugador, this.salario);

  static List<Agencia> jugadoresContratados = [];

  static contratarJugador(int id){
    String nombre = stdin.readLineSync()!;
    int salario= int.parse(stdin.readLineSync()!);
    jugadoresContratados.add(Agencia(nombre, id, salario));
  }

  static jugadoresContratos(){
    if (jugadoresContratados.isEmpty) {
      print('No hay jugadores contratados');
    } else {
      for (var j in jugadoresContratados) {
        print('Nombre: ${j.nombre} - Id: ${j.idJugador} - Salario: ${j.salario}');
      }      
    }
  }

}