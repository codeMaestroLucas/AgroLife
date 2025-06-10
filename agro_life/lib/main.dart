import 'package:agro_life/widgets/agrolife_title.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgroLife',
      themeMode: ThemeMode.dark,
      // The theme will be set based on the system theme
      // You can also set it to ThemeMode.light or ThemeMode.dark to force a specific theme
      // theme: TAppTheme.lightTheme,
      // darkTheme: TAppTheme.darkTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AgroLifeTitle()),
      // body: MainPage()
      body: TestApp(),
    );
  }
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 2 / 3,
          child: Text(
            'O objetivo deste projeto é desenvolver um software - aplicação web e móvel - capaz de armazenar dados de bovinos, identificá-los e manejá-los, bem como controlar a nutrição destes, a fim de preservar a integridade e o bem-estar dos animais.',
          ),
        ),
      ),
    );
  }
}
