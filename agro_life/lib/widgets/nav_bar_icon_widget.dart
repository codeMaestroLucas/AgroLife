import 'package:agro_life/models/nav_bar_icon_model.dart';
import 'package:agro_life/my_constraints.dart';
import 'package:flutter/material.dart';

class NavBarIconWidget extends StatelessWidget {
  final NavBarIconModel iconModel;
  final int currentIndex;
  final ValueChanged<int> onPressed;

  const NavBarIconWidget({
    super.key,
    required this.iconModel,
    required this.currentIndex,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onPressed(iconModel.index),
      icon: Icon(
        iconModel.getIconForIndex(currentIndex),
        size: sizeIcon,
        color: iconModel.getColorForIndex(currentIndex),
      ),
    );
  }
}
