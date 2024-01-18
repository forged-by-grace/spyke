import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/redux/appstate.dart';

import '../scenes/forgot_password.dart';
import '../utility/app_navigation.dart';
import '../utility/constants.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomTextButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          textAlign: TextAlign.end,
          style: TextStyle(
            fontSize: fontSizeSmall,
            fontWeight: FontWeight.w600,
            color: themeState.isDarkMode ? accentColorLight : primaryColorLight,
          ),
        ),
      ),
    );
  }
}
