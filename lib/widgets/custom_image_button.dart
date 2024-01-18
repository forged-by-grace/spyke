import 'package:flutter/material.dart';

import '../utility/constants.dart';

class CustomCircularImageButton extends StatelessWidget {
  final String url;
  final double? radius;
  final VoidCallback? onPressed;

  const CustomCircularImageButton(
      {super.key, required this.url, this.radius, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
          Radius.circular((radius != null) ? radius! : kDefaultImageRadius)),
      child: CircleAvatar(
        radius: (radius != null) ? radius! : kDefaultImageRadius,
        backgroundImage: AssetImage(
          url,
        ),
      ),
    );
  }
}
