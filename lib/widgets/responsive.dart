import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 700;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 750 &&
      MediaQuery.of(context).size.width <= 992;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 992;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (width > 992) {
      return desktop;
    } else if (width > 750 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
