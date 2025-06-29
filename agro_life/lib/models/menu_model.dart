import 'package:flutter/material.dart';

class MenuModel {
  final IconData icon;
  final String title;
  final int index;

  const MenuModel(this.index, {required this.icon, required this.title});
}
