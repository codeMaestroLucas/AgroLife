import 'package:agro_life/data/nav_bar_icon_data.dart';
import 'package:agro_life/my_constraints.dart';
import 'package:agro_life/screens/camera/camera_screen.dart';
import 'package:agro_life/screens/home/home_screen.dart';
import 'package:agro_life/screens/management/management_screen.dart';
import 'package:agro_life/widgets/nav_bar_icon_widget.dart';
import 'package:flutter/material.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int currentIndex = 1; // Home screen selected.

  final screens = [ManagementScreen(), HomeScreen(), CameraScreen()];

  @override
  Widget build(BuildContext context) {
    final bool isCameraScreen = currentIndex == 2;

    return Scaffold(
      // Only show FAB when not on camera
      floatingActionButton:
          isCameraScreen
              ? null
              : FloatingActionButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                backgroundColor: colorDarkGreen,
                shape: const CircleBorder(),
                child: Icon(
                  Icons.home_rounded,
                  size: sizeIcon + 4,
                  color: colorWhite,
                ),
              ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Only show BottomAppBar when not on camera
      bottomNavigationBar:
          isCameraScreen
              ? null
              : BottomAppBar(
                elevation: 1,
                height: 60,
                color: colorBottomAppBarBg,
                shape: const CircularNotchedRectangle(),
                notchMargin: 10,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _generateNavIcons(),
                ),
              ),

      body: screens[currentIndex],
    );
  }

  List<Widget> _generateNavIcons() {
    final navBarIcons = NavBarIconData().data;

    return [
      // Left icon
      NavBarIconWidget(
        iconModel: navBarIcons[0],
        currentIndex: currentIndex,
        onPressed: (index) {
          setState(() => currentIndex = index);
        },
      ),

      const SizedBox(width: 16),

      // Right icon (camera)
      NavBarIconWidget(
        iconModel: navBarIcons[1],
        currentIndex: currentIndex,
        onPressed: (index) {
          if (index == 2) {
            // Open camera full screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CameraScreen()),
            );
          } else {
            setState(() => currentIndex = index);
          }
        },
      ),
    ];
  }
}
