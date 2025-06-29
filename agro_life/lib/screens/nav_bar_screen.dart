import 'package:agro_life/data/nav_bar_icon_data.dart';
import 'package:agro_life/my_constraints.dart';
import 'package:agro_life/screens/camera/camera_screen.dart';
import 'package:agro_life/screens/home/home_screen.dart';
import 'package:agro_life/screens/management/management_screen.dart';
import 'package:agro_life/util/responsive.dart';
import 'package:agro_life/widgets/nav_bar_icon_widget.dart';
import 'package:flutter/material.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int currentIndex = 1; // Home screen selected
  int currentSlide = 0;

  // Helper method to get the current screen widget
  Widget _getCurrentScreen() {
    if (currentIndex == 0) {
      return ManagementScreen(
        onChange: (value) => setState(() => currentSlide = value),
        currentSlide: currentSlide,
      );
    } else if (currentIndex == 1) {
      return const HomeScreen();
    } else {
      return const CameraScreen();
    }
  }

  // Helper method to generate navigation bar icons
  List<Widget> _generateNavIcons() {
    final navBarIcons = NavBarIconData().data;

    return [
      // Left icon (Management)
      NavBarIconWidget(
        iconModel: navBarIcons[0],
        currentIndex: currentIndex,
        onPressed: (index) {
          setState(() => currentIndex = index);
        },
      ),

      const SizedBox(width: 16), // Space for the FAB
      // Right icon (Camera)
      NavBarIconWidget(
        iconModel: navBarIcons[1],
        currentIndex: currentIndex,
        onPressed: (index) {
          if (index == 2) {
            // Push full screen camera
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CameraScreen()),
            ).then((_) {
              // Optional: If you want to reset currentIndex after popping CameraScreen
              // setState(() { currentIndex = 1; }); // Go back to home after camera
            });
          } else {
            setState(() => currentIndex = index);
          }
        },
      ),
    ];
  }

  // Helper method to generate the responsive layout
  Widget _generateResponsiveLayout(BuildContext context) {
    final bool isCameraScreen = currentIndex == 2; // Define here

    if (Responsive.isDesktop(context)) {
      return const Scaffold(
        body: Row(
          children: [
            // Expanded(child: child)
          ],
        ),
      );
    } else {
      return Scaffold(
        floatingActionButton:
            isCameraScreen
                ? null // No FAB if camera screen is active
                : FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      currentIndex = 1; // Go to Home
                    });
                  },
                  backgroundColor: colorDarkBlue,
                  shape: const CircleBorder(),
                  child: Icon(
                    Icons.home_rounded,
                    size: sizeIcon + 4,
                    color: colorWhite,
                  ),
                ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:
            isCameraScreen
                ? null // No BottomAppBar if camera screen is active
                : BottomAppBar(
                  elevation: 1,
                  height: 60,
                  color: colorBottomAppBarBg,
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 10,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _generateNavIcons(),
                  ),
                ),

        body: _getCurrentScreen(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _generateResponsiveLayout(context);
  }
}
