import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/utility/constants.dart';

import '../redux/appstate.dart';

class CustomRegion extends StatelessWidget {
  final Widget child;
  final bool isStatusIconLight;
  final double? verticalPadding;
  final double? horizontalPadding;
  final Color? bgColor;
  final AppBar? appBar;

  const CustomRegion(
      {super.key,
      required this.child,
      required this.isStatusIconLight,
      this.verticalPadding,
      this.horizontalPadding,
      this.bgColor,
      this.appBar});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isStatusIconLight ? statusBarStyleLight : statusBarStyleDark,
      child: Scaffold(
        body: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (_, themeState) => Container(
            padding: EdgeInsets.symmetric(
                horizontal:
                    (horizontalPadding != null) ? horizontalPadding! : 0,
                vertical: (verticalPadding != null) ? verticalPadding! : 0),
            decoration: BoxDecoration(
              color: (bgColor != null)
                  ? bgColor!
                  : themeState.isDarkMode
                      ? primaryColorDark
                      : primaryColorLight,
              gradient:
                  themeState.isDarkMode ? kBackgroundDark : kBackgroundLight,
            ),
            child: SafeArea(child: child),
          ),
        ),
      ),
    );
  }
}
