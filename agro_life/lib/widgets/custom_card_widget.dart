import 'package:agro_life/my_constraints.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final String? title;

  const CustomCard({
    super.key,
    required this.child,
    this.color,
    this.padding,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: color ?? colorCardBg,
        borderRadius: BorderRadius.circular(4),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [if (title != null) Text(title!, style: txtSubTitle), child],
      ),
    );
  }
}
