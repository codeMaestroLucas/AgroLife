import 'package:agro_life/screens/camera/camera_screen.dart';
import 'package:agro_life/screens/home/widgets/dash_board_widget.dart';
import 'package:agro_life/screens/home/widgets/side_menu/side_menu_widget.dart';
import 'package:agro_life/screens/home/widgets/side_menu/summary_widget.dart';
import 'package:agro_life/screens/management/management_screen.dart';
import 'package:agro_life/util/responsive.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final int currentItem;
  final ValueChanged<int> onItemSelected;

  const HomeScreen({
    super.key,
    required this.currentItem,
    required this.onItemSelected,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _selectedScreen;

  @override
  void initState() {
    super.initState();
    _selectedScreen = widget.currentItem;
  }

  Widget _buildCurrentScreen() {
    switch (_selectedScreen) {
      case 0:
        return ManagementScreen(currentSlide: 0, onChange: (val) {});
      case 1:
        return DashBordWidget();
      case 2:
        return CameraScreen();
      default:
        return DashBordWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      endDrawer:
          isMobile
              ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const SummaryWidget(),
              )
              : null,

      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop)
              Expanded(
                flex: 2,
                child: SideMenuWidget(
                  currentItem: _selectedScreen,
                  onItemSelected: (index) {
                    setState(() {
                      _selectedScreen = index;
                    });
                    widget.onItemSelected(index); // notify parent
                  },
                ),
              ),
            Expanded(flex: 7, child: _buildCurrentScreen()),
            if (isDesktop) const Expanded(flex: 3, child: SummaryWidget()),
          ],
        ),
      ),
    );
  }
}
