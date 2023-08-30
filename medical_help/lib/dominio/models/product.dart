import 'package:flutter/material.dart';

class Product{
  int id=UniqueKey().hashCode;
  String name;
  String description;
  double price;
  int stock;
  int quantity=0;
  bool state=true;
  String image;

Product({
  required this.name,
  required this.description,
  required this.price,
  required this.stock,
  required this.image
});
}