import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/utility/constants.dart';

class CustomLabelButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? color;
  final IconData icon;
  final double? fontSize;
  final double? marginLeft;
  final double? marginRight;
  final double? marginTop;
  final double? marginBottom;

  const CustomLabelButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.color,
      required this.icon,
      this.marginLeft,
      this.marginRight,
      this.marginTop,
      this.marginBottom,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: marginLeft ?? kDefaultPadding,
        top: marginTop ?? kDefaultPadding,
        bottom: marginBottom ?? kDefaultPadding,
        right: marginRight ?? kDefaultPadding,
      ),
      
      child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (_, themeState) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: (color != null)
                      ? color
                      : themeState.isDarkMode
                          ? primaryColorLight
                          : accentColorLight,
                  fontSize: fontSize ?? fontSizeModerate,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: onPressed,
              child: Icon(
                icon,
                size: kDefaultIconSize,
                color: (color != null)
                    ? color!
                    : themeState.isDarkMode
                        ? primaryColorLight
                        : accentColorLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
