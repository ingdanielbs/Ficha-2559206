import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  String name = 'Juan';
  var lastName = 'Perez';

  const pi = 3.1416;  

  final double gravity;
  gravity = 9.8;
  
  dynamic saludo = 'Hola';
  saludo = 31;

  int age = 31;
  print(age);

  double weight = 1.0;

  String name2 = 'Oscar';
  print(name2[2]);
  
  print('Hola $name $lastName, bienvenido. La suma de tu edad y el peso es: ${age + weight}');

  bool isTrue = true;

  List <int> numbers = [1,2,3,4,5];

  numbers.add(6); // Agrega un elemento al final de la lista

  numbers.remove(2);

  numbers.removeAt(2);

  numbers[3] = 50;
  print('Escribe tu programa de formación');
  /* String program = stdin.readLineSync()!; */

/*   bool estado = true;

  if(estado){
    print('Hola');
  }

  9 > 10 ? print('Hola') : print('Otra cosa'); */

  var opciones = ['piedra ', 'papel', 'tijera'];
  var compuutadora = opciones[Random().nextInt(3)];

  //piedra, papel, tijera
  print('Escribe tu opción');
  var opcion = stdin.readLineSync()!;
  print('Computadora: $compuutadora');
  if(opcion == compuutadora){
    print('Empate');
  }else if(opcion == 'piedra' && compuutadora == 'tijera'){
    print('Ganaste');
  }else if(opcion == 'papel' && compuutadora == 'piedra'){
    print('Ganaste');
  }else if(opcion == 'tijera' && compuutadora == 'papel'){
    print('Ganaste');
  }else{
    print('Perdiste');
  }

}