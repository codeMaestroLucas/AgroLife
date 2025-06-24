import 'package:agro_life/my_constraints.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  const CustomCard({super.key, required this.child, this.color, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color ?? colorCardBg),

      child: Padding(
        padding: padding ?? const EdgeInsets.all(12),

        child: child,
      ),
    );
  }
}
