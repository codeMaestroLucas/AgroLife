import 'package:flutter/material.dart';

class AgroLifeTitle extends StatelessWidget {
  const AgroLifeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontFamily: 'Galada', fontSize: 32),
        children: [
          TextSpan(text: "Agro"),
          TextSpan(
            text: "L",
            style: TextStyle(
              letterSpacing: 1,
              color: const Color.fromARGB(255, 188, 25, 13),
              fontSize: 44,
            ),
          ),
          TextSpan(text: "ife"),
        ],
      ),
    );
  }
}
