import 'package:agro_life/data/side_menu.dart';
import 'package:agro_life/my_constraints.dart';
import 'package:flutter/material.dart';

class SideMenuWidget extends StatefulWidget {
  final int currentItem;
  final ValueChanged<int> onItemSelected;

  const SideMenuWidget({
    super.key,
    required this.currentItem,
    required this.onItemSelected,
  });

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.currentItem;
  }

  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();

    return Container(
      decoration: BoxDecoration(color: colorBg),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      
      child: ListView.builder(
        itemCount: data.menu.length,
        itemBuilder: (context, index) {
          final item = data.menu[index];
          final bool isSelected = selectedIndex == index;

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: isSelected ? colorSelection : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                widget.onItemSelected(index);
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Icon(
                      item.icon,
                      color: isSelected ? colorBlack : colorWhite,
                    ),
                  ),
                  Text(
                    item.title,
                    style: TextStyle(
                      color: isSelected ? colorBlack : colorWhite,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
