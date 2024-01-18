import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/utility/constants.dart';

class OutlinedBoxIcon extends StatelessWidget {
  final IconData icon;
  final double height;
  final double width;
  final Color iconColor;
  final double iconSize;
  final VoidCallback onPressed;

  const OutlinedBoxIcon(
      {super.key,
      required this.icon,
      required this.height,
      required this.width,
      required this.iconColor,
      required this.iconSize,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.all(Radius.circular(kDefaultRadius)),
            border: Border.all(
                color: themeState.isDarkMode
                    ? primaryColorLight
                    : primaryColorDark,
                style: BorderStyle.solid),
          ),
          child: Icon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
