import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/utility/constants.dart';

class CustomDmHeader extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Color? fontColor;
  final Color? headerBackground;

  const CustomDmHeader(
      {Key? key,
      required this.title,
      this.fontSize,
      this.fontColor,
      this.headerBackground})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(kDefaultPadding * 0.5),
            decoration: BoxDecoration(
              color: headerBackground ?? accentColorLight,
              borderRadius:
                  const BorderRadius.all(Radius.circular(kDefaultRadius)),
            ),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: fontSize ?? fontSizeModerate,
                  color: themeState.isDarkMode
                      ? fontColor ?? textColorLight
                      : fontColor ?? deepGray),
            ),
          ),
        ],
      ),
    );
  }
}
