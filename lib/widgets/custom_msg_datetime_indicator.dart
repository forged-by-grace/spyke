import 'package:flutter/material.dart';
import 'package:spyke/model/message.dart';
import 'package:spyke/utility/constants.dart';

class MessageDateTimeIndicator extends StatelessWidget {
  final Message message;

  const MessageDateTimeIndicator({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Text(
                message.timeStamp.split(',')[0],
                style: const TextStyle(
                  color: accentColorLight,
                ),
              ),
              const SizedBox(
                width: kDefaultPadding * 0.2,
              ),
              const CircleAvatar(
                radius: kDefaultIndicatorRadius,
                backgroundColor: accentColorLight,
              ),
              const SizedBox(
                width: kDefaultPadding * 0.2,
              ),
              Text(
                message.timeStamp.split(',')[1],
                style: const TextStyle(
                  color: accentColorLight,
                ),
              )
            ],
          ),
        ),
        message.isSender
            ? Icon(
                buildIcon(message.status),
                size: 24,
                color: accentColorLight,
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  IconData? buildIcon(String status) {
    if (status == MessageStatus.pending.toString()) {
      return Icons.pending;
    } else if (status == MessageStatus.sent.toString()) {
      return Icons.done;
    } else {
      return Icons.done_all;
    }
  }
}
