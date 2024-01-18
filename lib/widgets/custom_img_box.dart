import 'package:flutter/material.dart';
import 'package:spyke/utility/constants.dart';

class CustomImgBox extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final double? cornerRadius;
  final Color? backgroundColor;

  const CustomImgBox({super.key, required this.url, this.height, this.width, this.cornerRadius, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 120,
      width: width ?? 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerRadius ?? kDefaultRadius),
          color: backgroundColor ?? textColorLight),
      child: Image.asset(url, fit: BoxFit.cover,),
    );
  }
}
