import 'package:flutter/material.dart';

class BottomBarItem {
  final String title;
  final IconData icon;
  final Widget page;

  const BottomBarItem({
    required this.title,
    required this.icon,
    required this.page,
  });
}
