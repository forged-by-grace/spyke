import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:spyke/widgets/custom_msg_builder.dart';

import '../model/message.dart';
import '../utility/constants.dart';
import 'custom_msg_datetime_indicator.dart';
import 'custom_msg_quick_action.dart';

class CustomMessageReceiver extends StatelessWidget {
  final Message message;
  final int currentIndex;
  const CustomMessageReceiver({
    super.key,
    required this.message,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 48,
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: kDefaultPadding * 0.5,
              right: kDefaultPadding * 0.5,
              top: (currentIndex != 0 && !messages[currentIndex - 1].isSender)
                  ? kDefaultPadding * 0.1
                  : kDefaultPadding * 0.5,
              bottom: (currentIndex < (messages.length - 1) &&
                      !messages[currentIndex + 1].isSender)
                  ? kDefaultPadding * 0.1
                  : kDefaultPadding * 0.5,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(kDMmessageRadius),
                topRight: const Radius.circular(kDMmessageRadius),
                bottomLeft:
                    (currentIndex != 0 && !messages[currentIndex - 1].isSender)
                        ? const Radius.circular(kDMmessageRadius)
                        : Radius.zero,
                bottomRight: const Radius.circular(kDMmessageRadius),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: msgRecipientBgColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(kDMmessageRadius),
                    topRight: const Radius.circular(kDMmessageRadius),
                    bottomLeft: (currentIndex != 0 &&
                            !messages[currentIndex - 1].isSender)
                        ? const Radius.circular(kDMmessageRadius)
                        : Radius.zero,
                    bottomRight: const Radius.circular(kDMmessageRadius),
                  ),
                  border: Border.all(
                    color: primaryColorLight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7),
                      padding: const EdgeInsets.all(kDefaultPadding * 0.5),
                      child: ReadMoreText(
                        message.title,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: fontSizeModerate, color: Colors.black),
                        trimMode: TrimMode.Line,
                        trimLines: kDefaultTrimLines,
                        colorClickableText: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: kDefaultPadding * 0.5,
                          right: kDefaultPadding * 0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            message.timeStamp.split(',')[0].toLowerCase(),
                            style: const TextStyle(
                              color: deepGray,
                              fontSize: fontSizeSmall,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          CustomMessageQuickAction(
            message: message,
          ),
        ],
      ),
    );
  }
}
