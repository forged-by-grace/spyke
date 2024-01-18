import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/redux/appstate.dart';

import '../utility/constants.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? color;

  const CustomBackButton({super.key, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (_, themeState) => GestureDetector(
              onTap: onPressed,
              child: Icon(
                Icons.arrow_back,
                size: 32,
                color: (color != null)
                    ? color
                    : themeState.isDarkMode
                        ? primaryColorLight
                        : accentColorLight,
              ),
            ));
  }
}
