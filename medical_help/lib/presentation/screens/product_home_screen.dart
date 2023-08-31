import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medical_help/presentation/screens/product_registration_screen.dart';
import 'package:medical_help/presentation/widgets/appbar_menu.dart';

import '../../datos/products_list.dart';
import '../../dominio/models/product.dart';

class ProductHomeScreen extends StatefulWidget {
  const ProductHomeScreen({super.key});

  @override
  State<ProductHomeScreen> createState() => _ProductHomeScreenState();
}

class _ProductHomeScreenState extends State<ProductHomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<Product> filterItems = products;

  void searchItem(String text) {
    setState(() {
      filterItems = products
          .where((i) => i.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarMenu(title: 'Productos'),
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
                  builder: (context) => const ProductRegistrationScreen(),
                ),
              );
            },
            child: const Text('Registrar producto'),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: searchItem,
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Buscar',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filterItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('${filterItems[index].name},'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.file(
                                      File(filterItems[index].image),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text('Id: ${filterItems[index].id}'),
                                    Text('Nombre: ${filterItems[index].name},'),
                                    Text(
                                        'Descripción: ${filterItems[index].description}'),
                                    Text('Precio: ${filterItems[index].price}'),
                                    Text('Stock: ${filterItems[index].stock}'),
                                    Text('Estado: ${filterItems[index].state}'),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cerrar'))
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
                                File(filterItems[index].image),
                                height: 70,
                                width: 70,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          filterItems[index].name,
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          filterItems[index].description,
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          '\$${filterItems[index].price}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove),
                        ),
                        Text('${filterItems[index].quantity}'),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_shopping_cart),
                        ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
