import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:readmore/readmore.dart';
import 'package:spyke/model/message.dart';
import 'package:spyke/widgets/custom_msg_builder.dart';
import 'package:spyke/widgets/custom_msg_datetime_indicator.dart';

import '../utility/constants.dart';
import 'custom_msg_quick_action.dart';

class CustomMessageSender extends StatelessWidget {
  final Message message;
  final int currentIndex;
  final bool stillSender;

  const CustomMessageSender(
      {super.key,
      required this.message,
      required this.currentIndex,
      required this.stillSender});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 48,
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomMessageQuickAction(
            message: message,
          ),
          const SizedBox(
            width: kDefaultPadding * 0.2,
          ),
          Container(
            margin: EdgeInsets.only(
              left: kDefaultPadding * 0.5,
              right: kDefaultPadding * 0.5,
              top: (currentIndex != 0 && messages[currentIndex - 1].isSender)
                  ? kDefaultPadding * 0.1
                  : kDefaultPadding * 0.5,
              bottom: (currentIndex < (messages.length - 1) &&
                      messages[currentIndex + 1].isSender)
                  ? kDefaultPadding * 0.1
                  : kDefaultPadding * 0.5,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(kDMmessageRadius),
                topRight: const Radius.circular(kDMmessageRadius),
                bottomLeft: const Radius.circular(kDMmessageRadius),
                bottomRight:
                    (currentIndex != 0 && messages[currentIndex - 1].isSender)
                        ? const Radius.circular(kDMmessageRadius)
                        : Radius.zero,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: dmSenderBgColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(kDMmessageRadius),
                    topRight: const Radius.circular(kDMmessageRadius),
                    bottomLeft: const Radius.circular(kDMmessageRadius),
                    bottomRight: (currentIndex != 0 &&
                            messages[currentIndex - 1].isSender)
                        ? const Radius.circular(kDMmessageRadius)
                        : Radius.zero,
                  ),
                  border: Border.all(
                    color: primaryColorLight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7),
                      padding: const EdgeInsets.all(kDefaultPadding * 0.5),
                      child: ReadMoreText(
                        message.title,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: fontSizeModerate, color: Colors.black),
                        trimMode: TrimMode.Line,
                        trimLines: kDefaultTrimLines,
                        colorClickableText: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: kDefaultPadding * 0.2,
                          left: kDefaultPadding * 0.5),
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
                          const Icon(
                            Icons.done,
                            size: fontSizeSmall * 1.5,
                            color: deepGray,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
