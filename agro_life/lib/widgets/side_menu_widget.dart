import 'package:agro_life/data/side_menu.dart';
import 'package:agro_life/models/menu_model.dart';
import 'package:agro_life/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int currentItem = 0;

  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();

    return Container(
      decoration: BoxDecoration(color: AppColors.bg),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      
      child: ListView.builder(
        itemCount: data.menu.length,
        itemBuilder:
            (context, index) => buildMenuEntry(data.menu[index], index),
      ),
    );
  }

  Widget buildMenuEntry(MenuModel item, int index) {
    final bool isSelected = currentItem == index;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.selection : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),

      child: InkWell(
        onTap:
            () => setState(() {
              currentItem = index;
            }),

        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Icon(
                item.icon,
                color: isSelected ? AppColors.black : AppColors.secondary,
              ),
            ),
            
            Text(
              item.title,
              style: TextStyle(
                color: isSelected ? AppColors.black : AppColors.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
