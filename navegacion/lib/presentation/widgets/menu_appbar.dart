import 'package:flutter/material.dart';

class MenuAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MenuAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Navegación'),
      backgroundColor: Colors.deepOrange,
    );
  }
  
  @override  
  Size get preferredSize => const Size(0, kToolbarHeight);
}