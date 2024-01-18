import 'package:flutter/material.dart';
import 'package:spyke/widgets/illustration.dart';

class CustomSvg extends StatelessWidget {
  final String url;

  const CustomSvg({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return IllustrationWidget(
        imgUrl: url,
        height: MediaQuery.of(context).size.shortestSide * 0.6,
        width: MediaQuery.of(context).size.shortestSide * 0.6);
  }
}
