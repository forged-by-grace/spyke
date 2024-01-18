import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const CustomDivider({
    super.key,
    required this.width,
    required this.height,
    required this.color, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,        
        borderRadius: BorderRadius.all(
          Radius.circular(width * 0.5),
        ),
      ),
    );
  }
}
