import 'dart:io';

import 'jugador.dart';

void main(List<String> args) {
  /* var jugador1 = Jugador('Lionel', 'Messi', 70.8, 'Inter', 10, true);
  var jugador2 = Jugador.sinPos('Cristiano', 'Ronaldo', 80.5, 'Juventus', false); */

  /* print('Nombre: ${jugador1.name} Apellido: ${jugador1.lastName}'); */

  /*  jugador1.infoJugador();
  jugador2.infoJugador(); */

  while (true) {
    print('1. Registrar jugador \n2. Cambiar estado \n3.Salir');
    int option = int.parse(stdin.readLineSync()!);
    switch (option) {
      case 1:
        Jugador.playerRegister();
        break;
      case 2:
        Jugador.changeStatus();
        break;
      case 3:
        print('Adios');
        exit(0);
      default:
        print('Opción no válida');
        break;
    }
  }
}
