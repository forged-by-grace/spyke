import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:spyke/model/message.dart';
import 'package:spyke/utility/constants.dart';

import 'custom_msg_datetime_indicator.dart';

class CustomMessageBuilder extends StatelessWidget {
  final Message message;
  final Color backgroundColor;
  const CustomMessageBuilder(
      {super.key, required this.message, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: backgroundColor,
          width: double.maxFinite,
          padding: const EdgeInsets.all(kDefaultPadding * 0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (message.attachments != null || message.reply != null)
                  ? buildAttachment(
                      context: context,
                      reply: message.reply,
                      attachments: message.attachments)
                  : const SizedBox.shrink(),
              ReadMoreText(
                message.title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontSize: fontSizeSmall, color: accentColorLight),
                trimMode: TrimMode.Line,
                trimLines: kDefaultTrimLines,
                colorClickableText: Colors.amber,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: MessageDateTimeIndicator(message: message),
        )
      ],
    );
  }
}
