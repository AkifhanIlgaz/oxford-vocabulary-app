import 'package:flutter/material.dart';

class DrawerItem {
  DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.color,
  });

  final IconData icon;
  final String title;
  final void Function() onTap;
  final Color? color;
}
