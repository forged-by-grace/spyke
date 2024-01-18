import 'package:flutter/material.dart';
import 'package:spyke/utility/constants.dart';

class CustomTextBox extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomTextBox({super.key, required this.text, this.backgroundColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding * 0.2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: (backgroundColor != null) ? backgroundColor : Colors.green,
        borderRadius: const BorderRadius.all(Radius.circular(kDefaultRadius)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: (textColor != null) ? textColor : Colors.white,
          fontSize: fontSizeSmall,
        ),
      ),
    );
  }
}
