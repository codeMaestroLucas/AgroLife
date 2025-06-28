import 'package:agro_life/my_constraints.dart';
import 'package:flutter/material.dart';

class DeceasedCowInfoScreen extends StatelessWidget {
  const DeceasedCowInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doença identificada', style: txtHeading2),
      ),

      body: const Center(
        child: Padding(
          padding: paddingMainScreens,

          child: Column(
            children: [
              Icon(Icons.warning, size: 80, color: Colors.red),
              SizedBox(height: 10),
              Text(
                'Foi identificado um ferimento no casco.\n\nA causa pode estar relacionada a infecções, má higiene ou manejo inadequado.\nRecomenda-se inspeção no rebanho, melhoria nas condições do solo e nos cuidados com os cascos para evitar novos casos.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
