import 'package:flutter/material.dart';
import 'package:spyke/widgets/custom_msg_receiver.dart';
import 'package:spyke/widgets/custom_msg_sender.dart';

import '../model/message.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  final int currentIndex;
  final bool stillSender;

  const MessageCard(
      {super.key, required this.message, required this.currentIndex, required this.stillSender});

  @override
  Widget build(BuildContext context) {
    return message.isSender
        ? CustomMessageSender(
            message: message,
            currentIndex: currentIndex,
            stillSender: stillSender,
          )
        : CustomMessageReceiver(message: message, currentIndex: currentIndex);
  }
}
