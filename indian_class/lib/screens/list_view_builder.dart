import 'package:flutter/material.dart';
import 'package:indian_class/models/product.dart';

class MyListViewBuilder extends StatelessWidget {
  MyListViewBuilder({super.key});

  final List<Map<String, dynamic>> products = [
    {"name": "Bed", "details": "King size bed", "price": 3000.0},
    {"name": "Sofa", "details": "Large sofa", "price": 3600.0},
    {"name": "Chair", "details": "Wood modern chair", "price": 1200.9},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Product(
          name: products[index]['name'],
          description: products[index]['details'],
          price: products[index]['price'],
        );
      },
    );
  }
}
