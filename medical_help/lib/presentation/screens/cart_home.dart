import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medical_help/dominio/models/product.dart';
import 'package:medical_help/presentation/widgets/appbar_menu.dart';

class CartHome extends StatefulWidget {
  final List<Product> cart;
  const CartHome({super.key, required this.cart});

  @override
  State<CartHome> createState() => _CartHomeState();
}

class _CartHomeState extends State<CartHome> {
  @override
  Widget build(BuildContext context) {
    double total =
        widget.cart.fold(0, (sum, item) => sum + (item.quantity * item.price));
    return Scaffold(
      appBar: const AppbarMenu(title: 'Carrito'),
      body: ListView.builder(
        itemCount: widget.cart.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.file(
                File(widget.cart[index].image),
                height: 70,
                width: 70,
              ),
              Text(' ${widget.cart[index].name}'),
              Text(' ${widget.cart[index].quantity}'),
              Text(
                  ' ${widget.cart[index].price * widget.cart[index].quantity}'),
              IconButton(
                  onPressed: () {
                    setState(() {
                      widget.cart.removeAt(index);
                    });
                  },
                  icon: const Icon(Icons.remove_shopping_cart))
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if(widget.cart.isNotEmpty){
            setState(() {
            widget.cart.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Compra exitosa'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
          });
          }
        },
        label: Text('Total: \$$total'),
      ),
    );
  }
}
