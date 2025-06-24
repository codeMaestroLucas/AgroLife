import 'package:agro_life/my_constraints.dart';
import 'package:flutter/material.dart';

class NavBarIconModel {
  final IconData icon;
  final IconData? activeIcon;
  final int index;

  NavBarIconModel({
    required this.icon,
    this.activeIcon,
    required this.index,
  });

  IconData getIconForIndex(int currentIndex) {
    return currentIndex == index ? (activeIcon ?? icon) : icon;
  }

  Color getColorForIndex(int currentIndex) {
    return currentIndex == index ? colorPrimary : Colors.grey.shade400;
  }
}
