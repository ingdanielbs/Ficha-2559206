import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medical_help/presentation/screens/cart_home.dart';
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
  List<Product> cart = [];

  void searchItem(String text) {
    setState(() {
      filterItems = products
          .where((i) => i.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }

  void increaseQuantity(Product prod) {
    if (prod.quantity < prod.stock) {
      setState(() {
        prod.quantity++;
      });
    }
  }

  void decreaseQuantity(Product prod) {
    if (prod.quantity > 0) {
      setState(() {
        prod.quantity--;
      });
    }
  }

  void addCart(Product prod) {
    if (!cart.contains(prod) && prod.quantity > 0) {
      setState(() {
        cart.add(prod);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int cartLength = cart.length;
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          onPressed: () {
                            decreaseQuantity(filterItems[index]);
                          },
                          icon: const Icon(Icons.remove),
                        ),
                        Text('${filterItems[index].quantity}'),
                        IconButton(
                          onPressed: () {
                            increaseQuantity(filterItems[index]);
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          addCart(filterItems[index]);
                        },
                        icon: cart.contains(filterItems[index])
                            ? const Icon(Icons.check_box)
                            : const Icon(Icons.add_shopping_cart)),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartHome(
                cart: cart,
              ),
            ),
          );
        },
        child: Row(
            children: [const Icon(Icons.shopping_cart), Text('$cartLength')]),
      ),
    );
  }
}
