import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:spyke/redux/appstate.dart';

import '../utility/constants.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback? onBackPressed;
  final String? title;
  final double? height;
  final Color? bgColor;
  final bool? showTitle;
  final bool? showBackArrow;
  final Widget? action;
  final Color? titleColor;

  const CustomAppBar(
      {super.key,
      this.onBackPressed,
      this.title,
      this.bgColor,
      this.height,
      this.showTitle,
      this.showBackArrow,
      this.action, this.titleColor});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Material(
        child: Container(
          height: (height != null) ? height : defaultHeight,
          decoration: BoxDecoration(
            color: (bgColor != null)
                ? bgColor
                : themeState.isDarkMode
                    ? accentColorDark
                    : primaryColorLight,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(kDefaultRadius),
              bottomRight: Radius.circular(kDefaultRadius),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Row(
                children: [
                  (showBackArrow != null && showBackArrow == true)
                      ? IconButton(
                          tooltip: 'Back',
                          enableFeedback: false,
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Icons.arrow_back,
                            size: defaultIconSize,
                            color: themeState.isDarkMode
                                ? primaryColorLight
                                : accentColorLight,
                          ),
                        )
                      : const SizedBox.shrink(),
                  (showBackArrow != null && showBackArrow == true)
                      ? const SizedBox(
                          width: kDefaultPadding,
                        )
                      : const SizedBox.shrink(),
                  (title != null)
                      ? Text(
                          title!,
                          style: TextStyle(
                            color: (titleColor != null) ? titleColor : themeState.isDarkMode ? primaryColorLight : accentColorLight,
                            fontFamily: 'Script MT',
                            fontStyle: FontStyle.normal,
                            fontSize: fontSizeLarge,
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              )),
              (action != null) ? action! : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
