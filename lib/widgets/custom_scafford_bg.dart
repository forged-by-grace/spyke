import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/redux/appstate.dart';

import '../utility/constants.dart';

class CustomScaffordBackground extends StatelessWidget {
  final Widget child;

  const CustomScaffordBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Container(
        decoration: BoxDecoration(
                gradient:
                    themeState.isDarkMode ? kBackgroundDark : kScaffordBgLight),
            child: child,
      ),
    );
  }
}
