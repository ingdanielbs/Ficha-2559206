import 'package:flutter/material.dart';
import 'package:navegacion/presentation/screens/second_page.dart';
import 'package:navegacion/presentation/widgets/menu_appbar.dart';
import 'package:navegacion/presentation/widgets/menu_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: const MenuAppbar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Home Page',
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondPage(),
                ),
              );
            },
            child: const Text('Go to Second Page'),
          )
        ],
      )),
    );
  }
}
