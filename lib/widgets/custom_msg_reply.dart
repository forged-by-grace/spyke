import 'package:flutter/material.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/custom_box_img.dart';

class CustomMessageReply extends StatelessWidget {
  final String title;
  final String sender;
  final String? attachment;
  final Color? backgroundColor;

  const CustomMessageReply(
      {super.key,
      required this.title,
      required this.sender,
      this.attachment,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding * 0.5),
      decoration: BoxDecoration(
        color:
            (backgroundColor != null) ? backgroundColor! : Colors.amberAccent,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(kDefaultImageRadius),
            topRight: Radius.circular(kDefaultImageRadius)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (attachment != null)
              ? Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Stack(children: [
                    CustomBoxImage(
                        url: attachment!,
                        height: 75,
                        width: 75,
                        backgroundColor: Colors.transparent,
                        cornerRadius: kDefaultRadius),
                  ]),
                )
              : const SizedBox.shrink(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sender,
                  style: const TextStyle(
                    color: accentColorLight,
                    fontSize: fontSizeSmall,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding * 0.05,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: accentColorLight,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
