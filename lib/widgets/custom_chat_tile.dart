import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/enum/online_status.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/custom_dp_with_indicator.dart';
import 'package:spyke/widgets/custom_image_button.dart';

class CustomChatTile extends StatelessWidget {
  final String profileImgUrl;
  final String name;
  final String? timeStamp;
  final String message;
  final Widget? child;
  final double? horizontalMargin;
  final double? verticalMargin;
  final double? unreadMessages;
  final VoidCallback onPressed;
  final VoidCallback onProfileImgPressed;

  const CustomChatTile(
      {super.key,
      required this.profileImgUrl,
      required this.name,
      this.timeStamp,
      required this.message,
      this.unreadMessages,
      required this.onPressed,
      required this.onProfileImgPressed,
      this.child,
      this.horizontalMargin,
      this.verticalMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin ?? kDefaultPadding,
          vertical: verticalMargin ?? kDefaultPadding * 0.5),
      child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (_, themeState) => Row(
          children: [
            CustomDpWithIndicator(
              onlineStatus: OnlineStatus.active.index,
              onPressed: onProfileImgPressed,
              radius: kDefaultImageRadius,
            ),
            const SizedBox(
              width: kDefaultPadding * 0.5,
            ),
            Expanded(
              child: GestureDetector(
                onTap: onPressed,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: themeState.isDarkMode
                                  ? darkFontColor
                                  : textColorLight,
                              fontSize: fontSizeModerate,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            message,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: themeState.isDarkMode
                                  ? darkFontColor
                                  : accentFontColorLight,
                              fontSize: fontSizeSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                    (child != null)
                        ? child!
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                timeStamp!.toLowerCase(),
                                maxLines: 1,
                                style: TextStyle(
                                  color: (unreadMessages! > 0)
                                      ? primaryColorLight
                                      : themeState.isDarkMode
                                          ? darkFontColor
                                          : accentFontColorLight,
                                  fontSize: fontSizeSmall,
                                ),
                              ),
                              (unreadMessages! > 0)
                                  ? CircleAvatar(
                                      radius: kDefaultImageRadius * 0.5,
                                      backgroundColor: primaryColorLight,
                                      child: Text(
                                        unreadMessages.toString().split('.')[0],
                                        maxLines: 1,
                                        style: const TextStyle(
                                            color: accentColorLight,
                                            fontSize: fontSizeSmall),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
