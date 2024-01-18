import 'package:flutter/material.dart';
import 'package:spyke/utility/constants.dart';

class CustomFloatingButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String? tooltip;
  final Color? backgroundColor;
  final Color? iconColor;

  const CustomFloatingButton(
      {super.key, required this.icon, required this.onPressed, this.tooltip, this.backgroundColor, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: (tooltip != null) ? tooltip : '',
      backgroundColor: (backgroundColor != null) ? backgroundColor : primaryColorLight,
      onPressed: onPressed,
      child: Icon(
        icon,
        size: 24,
        color: (iconColor != null) ? iconColor : accentColorLight,
      ),
    );
  }
}
