import 'package:agro_life/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  const CustomCard({super.key, required this.child, this.color, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color ?? AppColors.cardBg),

      child: Padding(
        padding: padding ?? const EdgeInsets.all(12),
        
        child: child,
      ),
    );
  }
}
