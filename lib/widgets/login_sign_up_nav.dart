import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/redux/appstate.dart';

import '../utility/app_navigation.dart';
import '../utility/constants.dart';

class CustomLoginOrSignUpInquiry extends StatelessWidget {
  final String leadingTxt;
  final String actionTxt;
  final Widget nextScren;

  const CustomLoginOrSignUpInquiry(
      {super.key,
      required this.leadingTxt,
      required this.actionTxt,
      required this.nextScren});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Text.rich(
        TextSpan(
          text: leadingTxt,
          style: TextStyle(
              fontSize: fontSizeSmall,
              color:
                  themeState.isDarkMode ? accentColorLight : primaryColorDark),
          children: [
            TextSpan(
              text: actionTxt,
              style: const TextStyle(
                color: primaryColorLight,
                fontWeight: FontWeight.w700,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => nextScene(nextScene: nextScren),
            )
          ],
        ),
      ),
    );
  }
}
