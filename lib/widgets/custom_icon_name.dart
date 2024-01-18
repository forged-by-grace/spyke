import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../redux/appstate.dart';
import '../utility/constants.dart';

class CustomIconName extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final String title;

  const CustomIconName(
      {Key? key, required this.icon, this.color, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Row(
            children: [
              Icon(
                icon,
                size: defaultIconSize,
                color: color ??
                    (themeState.isDarkMode ? accentColorLight : textColorLight),
              ),
              const SizedBox(
                width: kDefaultPadding,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: fontSizeSmall,
                  color: color ??
                      (themeState.isDarkMode
                          ? accentColorLight
                          : textColorLight),
                ),
              ),
            ],
          ));
}
