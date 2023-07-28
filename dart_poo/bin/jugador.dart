import 'dart:io';

class Jugador {
  // Atributos
  int id;
  String name;
  String lastName;
  double weight;
  String team;
  int? position;
  bool status;

  static List<Jugador> jugadores = [];
  
  Jugador(this.id, this.name, this.lastName, this.weight, this.team, this.position, this.status);
  
  Jugador.sinPos(this.id, this.name, this.lastName, this.weight, this.team, this.status);

  void infoJugador(){
    print('Nombre: $name \nApellido: $lastName \nPeso: $weight \nEquipo: $team \nPosición: $position \nEstado: $status');
  }

  static Jugador? search (int id, var listaJugadores){
    for (var j in listaJugadores) {
      if (id == j.id) {
        return j;
      }        
      }
      return null;
    }  

  static playerRegister(){
    print('Ingrese el id:');
    int id = int.parse(stdin.readLineSync()!);
    if (search(id, jugadores) != null) {
      print('El jugador ya está registrado');
      return;  
    }
    print('Ingrese el nombre:');
    String name = stdin.readLineSync()!;
    print('Ingrese el apellido:');
    String lastName = stdin.readLineSync()!;
    print('Ingrese el peso:');
    double weight = double.parse(stdin.readLineSync()!);
    print('Ingrese el equipo:');
    String team = stdin.readLineSync()!;
    print('Ingrese la posición:');
    int position = int.parse(stdin.readLineSync()!);

    var jugador = Jugador(id, name, lastName, weight, team, position, true);
    jugadores.add(jugador);
  }

  static changeStatus(){
    print('Ingrese el id:');
    int id = int.parse(stdin.readLineSync()!);
    Jugador? result = search(id, jugadores); 
    if ( result != null) {
      result.status ? false : true;
      print('El estado del jugador ${result.name} con estado ${result.status} fue cambiado');        
    }else{
      print('El jugador no existe');
    }
  }
}