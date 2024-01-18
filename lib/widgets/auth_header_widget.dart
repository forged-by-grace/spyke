import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../redux/appstate.dart';
import '../utility/constants.dart';

class CustomAuthHeaderWidget extends StatelessWidget {
  final String title;
  final Widget middle;
  final String altHeader;

  const CustomAuthHeaderWidget(
      {super.key,
      required this.title,
      required this.middle,
      required this.altHeader});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
              color:
                  themeState.isDarkMode ? primaryColorLight : primaryColorDark,
              fontSize: fontSizeLarge,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Container(
            margin: const EdgeInsets.only(
                top: kDefaultPadding, bottom: kDefaultPadding * 0.5),
            child: middle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: Center(
              child: StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                builder: (_, themeState) => Text(
                  altHeader,
                  style: TextStyle(
                      fontSize: fontSizeModerate,
                      color: themeState.isDarkMode
                          ? accentColorLight
                          : primaryColorDark),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
