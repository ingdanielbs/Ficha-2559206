import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medical_help/dominio/models/doctor.dart';
import 'package:medical_help/presentation/screens/doctor_registration_screen.dart';
import 'package:medical_help/presentation/widgets/appbar_menu.dart';

import '../../datos/doctor_list.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<Doctor> filterItems = doctores;

  void searchItem(String text){
    setState(() {
      filterItems = doctores.where((i) => i.name.toLowerCase().contains(text.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarMenu(title: 'Doctores'),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DoctorRegistrationScreen(),
                ),
              );
            },
            child: const Text('Reistrar Doctor'),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: searchItem,
              controller: _searchController,
              decoration: const InputDecoration(
                  labelText: 'Buscar', prefixIcon: Icon(Icons.search)),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: filterItems.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(                    
                      context: context, 
                      builder: (context){
                        return AlertDialog(                          
                          title: Text('${filterItems[index].name} ${filterItems[index].lastName}'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.file(
                            File(filterItems[index].photo),                        
                          ),
                          const SizedBox(height: 20,),
                          Text('${filterItems[index].name} ${filterItems[index].lastName}'),
                          Text(filterItems[index].speciality),
                            ],
                          ),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: Text('Cerrar'))
                          ],
                        );
                      });
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(
                            File(filterItems[index].photo),
                            height: 70,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          '${filterItems[index].name} ${filterItems[index].lastName}',
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        )
                        /* Image.network(filterItems[index].photo) */
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
