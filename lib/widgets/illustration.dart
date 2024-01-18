import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IllustrationWidget extends StatelessWidget {
  final String imgUrl;
  final double? height;
  final double? width;

  const IllustrationWidget(
      {super.key,
      required this.imgUrl,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return (height != null && width != null) ? SizedBox(
      height: height,
      width: width,
      child: SvgPicture.asset(
        imgUrl,
        fit: BoxFit.contain,
      ),
    ) : SvgPicture.asset(
        imgUrl,
        fit: BoxFit.contain,
      );
  }
}
