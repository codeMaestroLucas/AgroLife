import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String name;
  final String description;
  final double price;

  const Product({
    super.key,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 8,
      children: [
        Image.asset(
          'assets/images/${name.toLowerCase()}.jpg',
          width: 200,
          height: 200,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              description,
              softWrap: true,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
                color: Colors.black87,
              ),
            ),
            Text("R\$${price.toStringAsFixed(2)}"),
          ],
        ),
      ],
    );
  }
}
