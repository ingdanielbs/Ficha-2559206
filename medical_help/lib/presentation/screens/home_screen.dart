import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medical_help/dominio/models/image_list.dart';
import 'package:medical_help/presentation/screens/doctor_home_screen.dart';
import 'package:medical_help/presentation/screens/product_home_screen.dart';
import 'package:medical_help/presentation/widgets/appbar_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarMenu(title: 'Medical Help'),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 218, 229, 237),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DoctorHomeScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.supervisor_account,
                        size: 50,
                        color: Color.fromARGB(255, 183, 58, 74),
                      ),
                    ),
                  ),
                  const Text('Doctores')
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 218, 229, 237),
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.accessibility,
                        size: 50,
                        color: Color.fromARGB(255, 40, 34, 35),
                      ),
                    ),
                  ),
                  const Text('Pacientes')
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 218, 229, 237),
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductHomeScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.local_hospital,
                        size: 50,
                        color: Color.fromARGB(255, 178, 174, 62),
                      ),
                    ),
                  ),
                  const Text('Farmacia')
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Productos destacados',
            style: TextStyle(
                color: Color.fromARGB(255, 178, 174, 62), fontSize: 18),
          ),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          ),
        ],
      ),
    );
  }
}
