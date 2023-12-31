import 'package:flutter/material.dart';
import 'package:navegacion/presentation/widgets/menu_appbar.dart';
import 'package:navegacion/presentation/widgets/menu_drawer.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: const MenuAppbar(),
      body: Center(
          child: Column(
        children: [
          const Text(
            'Second Page',
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ir a atras'),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      )),
    );
  }
}
