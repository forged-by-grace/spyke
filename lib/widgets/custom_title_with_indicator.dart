import 'package:flutter/material.dart';

import '../utility/constants.dart';

class CustomTitleWithIndicator extends StatelessWidget {
  final String title;
  final bool isOnline;

  const CustomTitleWithIndicator(
      {super.key, required this.title, required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        customTitle(title: title),
        (isOnline == true)
            ? const Positioned(
                top: 0,
                right: 0,
                child: CircleAvatar(
                  radius: kDefaultIndicatorRadius,
                  backgroundColor: Colors.green,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
