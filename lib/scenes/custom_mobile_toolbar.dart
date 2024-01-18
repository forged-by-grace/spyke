import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/redux/appstate.dart';

import '../utility/constants.dart';

class CustomMobileToolbar extends StatelessWidget {
  final Widget? leading;
  final String? title;
  final Widget? action;
  final bool? centerTitle;

  const CustomMobileToolbar(
      {super.key, this.leading, this.title, this.action, this.centerTitle});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Container(
        margin: const EdgeInsets.symmetric(horizontal: kDefaultElevation),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (centerTitle != null && centerTitle == true)
                ? const SizedBox(
                    width: 48,
                  )
                : const SizedBox.shrink(),
            (title != null)
                ? Text(
                    title!,
                    style: TextStyle(
                      color: themeState.isDarkMode
                          ? primaryColorLight
                          : accentColorLight,
                      fontFamily: 'Script MT',
                      fontStyle: FontStyle.normal,
                      fontSize: fontSizeLarge,
                    ),
                  )
                : const SizedBox.shrink(),
            (action != null) ? action! : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
