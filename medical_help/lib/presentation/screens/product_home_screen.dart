import 'package:flutter/material.dart';
import 'package:medical_help/presentation/screens/product_registration_screen.dart';
import 'package:medical_help/presentation/widgets/appbar_menu.dart';

class ProductHomeScreen extends StatefulWidget {
  const ProductHomeScreen({super.key});

  @override
  State<ProductHomeScreen> createState() => _ProductHomeScreenState();
}

class _ProductHomeScreenState extends State<ProductHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarMenu(title: 'Productos'),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductRegistrationScreen(),
                ),
              );
            },
            child: const Text('Registrar producto'),
          ),
        ],
      ),
    );
  }
}
