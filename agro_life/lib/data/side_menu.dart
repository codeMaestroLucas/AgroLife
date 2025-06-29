import 'package:agro_life/models/menu_model.dart';
import 'package:flutter/material.dart';

class SideMenuData {
  final menu = const <MenuModel>[
    MenuModel(icon: Icons.home, title: 'Dashboard', 1),
    MenuModel(icon: Icons.dns_rounded, title: 'Estoque', 0),
    MenuModel(icon: Icons.photo_camera, title: 'Câmera', 2),
    MenuModel(icon: Icons.logout, title: 'SingOut', -1),
  ];
}
