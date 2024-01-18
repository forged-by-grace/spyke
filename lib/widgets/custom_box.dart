import 'package:flutter/material.dart';
import 'package:spyke/utility/constants.dart';

class CustomBox extends StatelessWidget {
  final Widget child;
  final Color? fillColor;
  final Color? borderColor;
  final double? borderThickness;
  final double? borderRadiusAll;

  const CustomBox(
      {super.key,
      required this.child,
      this.fillColor,
      this.borderColor,
      this.borderThickness,
      this.borderRadiusAll});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding * 0.5),
      decoration: BoxDecoration(
        color: (fillColor != null) ? fillColor : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(
            (borderRadiusAll != null) ? borderRadiusAll! : kDefaultRadius)),
        border: Border.all(
            width: (borderThickness != null)
                ? borderThickness!
                : kDefaultBorderThickness,
            color: (borderColor != null) ? borderColor! : Colors.transparent),
      ),
      child: child,
    );
  }
}
