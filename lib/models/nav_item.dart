import 'package:flutter/material.dart';

class NavItem {
  final String id;
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final Widget page;

  NavItem(
      {required this.id,
      required this.label,
      required this.icon,
      required this.selectedIcon,
      required this.page});
}
