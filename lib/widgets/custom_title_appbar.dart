import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../redux/appstate.dart';
import '../utility/constants.dart';

class CustomTitleAppbar extends StatelessWidget {
  final Color? bgColor;
  final VoidCallback? onActionIconPressed;
  final Icon? actionIcon;
  final String? title;

  const CustomTitleAppbar(
      {Key? key,
      this.bgColor,
      this.onActionIconPressed,
      this.actionIcon,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Material(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(kDefaultRadius),
              bottomRight: Radius.circular(kDefaultRadius)),
          child: Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              color: bgColor != null
                  ? bgColor!
                  : themeState.isDarkMode
                      ? accentColorDark
                      : primaryColorLight,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(kDefaultRadius),
                bottomRight: Radius.circular(kDefaultRadius),
              ),
            ),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  title != null
                      ? Expanded(
                          child: customTitle(title: title ?? ''),
                        )
                      : const SizedBox.shrink(),
                  GestureDetector(
                    onTap: onActionIconPressed,
                    child: actionIcon ?? const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
