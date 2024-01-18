import 'package:flutter/material.dart';
import 'package:spyke/utility/constants.dart';

class CustomBoxImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final double? marginRight;
  final double? cornerRadius;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  const CustomBoxImage(
      {super.key,
      required this.url,
      this.height,
      this.width,
      this.cornerRadius,
      this.onPressed,
      this.backgroundColor,
      this.marginRight});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 120,
      width: width ?? 120,
      margin: EdgeInsets.only(right: marginRight ?? (kDefaultPadding * 0.5)),
      decoration: BoxDecoration(
          color: (backgroundColor != null) ? backgroundColor! : accentGreyBg,
          borderRadius: BorderRadius.all(
              Radius.circular(cornerRadius ?? kDefaultRadius))),
      child: Image.asset(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}
