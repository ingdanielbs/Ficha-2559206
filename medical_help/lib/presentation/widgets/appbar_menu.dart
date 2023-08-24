import 'package:flutter/material.dart';
import 'package:medical_help/main.dart';
import 'package:medical_help/presentation/styles/color_scheme.dart';

class AppbarMenu extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const AppbarMenu({super.key, required this.title});

  @override
  State<AppbarMenu> createState() => _AppbarMenuState();

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _AppbarMenuState extends State<AppbarMenu> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      actions: [
        IconButton(
          onPressed: () {
            final myapp = MyApp.of(context);
            if (myapp != null) {
              myapp.changeTheme();
            }
          },
          icon: Theme.of(context).brightness == Brightness.light
              ? const Icon(Icons.dark_mode)
              : const Icon(Icons.light_mode),
        ),
      ],
    );
  }
}
