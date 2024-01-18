import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';

import '../redux/appstate.dart';
import '../utility/constants.dart';
import '../utility/email_validator.dart';

class CustomEmail extends StatelessWidget {
  final String label;
  final String hint;
  final ValueChanged onchange;

  const CustomEmail(
      {super.key,
      required this.label,
      required this.hint,
      required this.onchange});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: onchange,
        validator: (value) {
          if (value == '') {
            return 'Email cannot be empty';
          } else if (!emailValid(value.toString())) {
            return 'Invalid email format';
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            labelStyle: TextStyle(
                fontSize: fontSizeSmall,
                color: themeState.isDarkMode
                    ? primaryColorLight
                    : accentColorLight),
            errorStyle: const TextStyle(
              fontSize: fontSizeSmall,
            ),
            hintStyle: const TextStyle(
              fontSize: fontSizeSmall,
            ),
            prefixIcon: Icon(
              Ionicons.mail_outline,
              size: 24,
              color:
                  themeState.isDarkMode ? primaryColorLight : primaryColorDark,
            )),
      ),
    );
  }
}
