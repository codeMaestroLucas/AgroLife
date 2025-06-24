import 'package:agro_life/my_constraints.dart';
import 'package:agro_life/screens/nav_bar_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

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
      
      home: const NavBarScreen(),
    );
  }
}
