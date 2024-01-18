import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../redux/appstate.dart';
import '../utility/constants.dart';

class CustomMobileAppBar extends AppBar {
  final String text;
  final Color? titleColor;
  final Icon? actionIcon;
  final VoidCallback? onActionIconPressed;
  final double? elevation;
  final bool? centertitle;

  CustomMobileAppBar(
      {super.key,
      required this.text,
      this.titleColor,
      this.actionIcon,
      this.elevation,
      this.onActionIconPressed, this.centertitle});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light),
        elevation: (elevation != null) ? elevation! : 0,
        backgroundColor:
            themeState.isDarkMode ? primaryColorDark : primaryColorLight,
        title: Text(
          text,
          style: TextStyle(
            color: (titleColor != null)
                ? titleColor!
                : themeState.isDarkMode
                    ? primaryColorLight
                    : accentColorLight,
            fontFamily: 'Script MT',
            fontStyle: FontStyle.normal,
            fontSize: fontSizeLarge,
          ),
        ),
        centerTitle: (centertitle != null) ? centertitle! : true,
        actions: [
          IconButton(
            onPressed:
                (onActionIconPressed != null) ? onActionIconPressed! : () {},
            icon: (actionIcon != null)
                ? actionIcon!
                : Icon(
                    themeState.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            color: themeState.isDarkMode ? primaryColorLight : accentColorLight,
          ),
        ],
      ),
    );
  }
}
