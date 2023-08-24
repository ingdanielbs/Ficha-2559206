import 'package:flutter/material.dart';
import 'package:medical_help/presentation/screens/doctor_registration_screen.dart';
import 'package:medical_help/presentation/widgets/appbar_menu.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarMenu(title: 'Doctores'),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorRegistrationScreen(),
                ),
              );
            },
            child: const Text('Reistrar Doctor'),
          ),
        ],
      ),
    );
  }
}
