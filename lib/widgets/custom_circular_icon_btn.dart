import 'package:flutter/material.dart';

import '../utility/constants.dart';

class CustomCircularIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? radius;
  final Color? backgroundColor;
  final IconData icon;
  final Color? iconColor;

  const CustomCircularIconButton(
      {super.key,
      required this.onPressed,
      this.radius,
      this.backgroundColor,
      required this.icon,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        radius: radius ?? 24,
        backgroundColor:
            (backgroundColor != null) ? backgroundColor : primaryColorLight,
        child: Icon(
          icon,
          color: (iconColor != null) ? iconColor : accentColorLight,
          size: kDefaultIconSize,
        ),
      ),
    );
  }
}
