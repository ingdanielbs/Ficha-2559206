import 'package:flutter/material.dart';
import 'package:navegacion/presentation/screens/home_page.dart';
import 'package:navegacion/presentation/screens/second_page.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepOrange),
            child: Text(
              'Menú',
              style: TextStyle(fontSize: 30),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Second Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondPage(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
