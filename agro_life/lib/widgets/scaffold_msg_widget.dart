import 'package:flutter/material.dart';
import 'package:agro_life/my_constraints.dart';

void showAppSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: colorWhite,
      closeIconColor: colorBlack, 
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 5,
      
      content: Text(
        message,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: colorBlack,
        ),
      ),

      duration: const Duration(seconds: 2),
      showCloseIcon: true,
    ),
  );
}