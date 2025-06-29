import 'package:agro_life/my_constraints.dart';
import 'package:agro_life/screens/home/home_screen.dart';
import 'package:agro_life/screens/nav_bar_screen.dart';
import 'package:agro_life/util/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    // Locked on portrait mode
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgroLife',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: colorBg,
      ),
      
      home: Builder(
        builder: (context) {
          if (Responsive.isDesktop(context)) {
            return HomeScreen(currentItem: 1, onItemSelected: _noop);
          } else {
            return const NavBarScreen();
          }
        },
      ),
    );
  }

  // Fallback handler to pass in desktop mode
  static void _noop(int _) {}
}
