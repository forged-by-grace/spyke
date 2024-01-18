import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/redux/appstate.dart';

import '../utility/constants.dart';

class CustomForgotText extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomForgotText(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: kDefaultPadding * 0.5),
            child: Text(
              title,
              style: TextStyle(
                color:
                    themeState.isDarkMode ? primaryColorLight : Colors.black54,
                fontSize: fontSizeLarge,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color:
                  themeState.isDarkMode ? accentColorLight : primaryColorDark,
              fontSize: fontSizeModerate,
            ),
          ),
        ],
      ),
    );
  }
}
