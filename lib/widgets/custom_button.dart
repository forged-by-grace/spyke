import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/redux/appstate.dart';

import '../utility/constants.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String txt;

  const CustomButtonWidget(
      {super.key, required this.onPressed, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: kDefaultPadding * 1.5, bottom: kDefaultPadding * 0.3),
      height: 48,
      width: MediaQuery.of(context).size.width,
      child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (_, themeState) => ElevatedButton(
          onPressed: onPressed,
          child: Text(
            txt,
            style: TextStyle(
                fontSize: fontSizeModerate,
                color: themeState.isDarkMode ? accentColorLight : Colors.white),
          ),
        ),
      ),
    );
  }
}
