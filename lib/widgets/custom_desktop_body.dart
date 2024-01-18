import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/utility/constants.dart';

class CustomDesktopBody extends StatelessWidget {
  final Widget child;

  const CustomDesktopBody({super.key, required this.child, 
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Container(
        margin: const EdgeInsets.all(kDefaultPadding),
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: themeState.isDarkMode ? Colors.black26 : accentColorLight,
          borderRadius: const BorderRadius.all(Radius.circular(kDefaultRadius)),
        ),
        child: child,
      ),
    );
  }
}
