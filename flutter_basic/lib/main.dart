import 'package:flutter/material.dart';
import 'package:flutter_basic/presentation/screens/botones.dart';
import 'package:flutter_basic/presentation/screens/home_page.dart';
import 'package:flutter_basic/presentation/screens/listas.dart';

void main() {
  runApp(MyApp());  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Botones(),
    );
  }
}