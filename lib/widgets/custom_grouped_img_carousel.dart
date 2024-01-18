import 'package:flutter/material.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/custom_img_scroll_carousel.dart';
import 'package:spyke/widgets/custom_label_btn.dart';

import '../model/user.dart';

class CustomGroupedImgCarousel extends StatelessWidget {
  final List<User> users;
  final String title;
  final Color? titleColor;
  final Color? thumbnailColor;
  final VoidCallback onIconPressed;
  final double? marginStart;
  final double? fontSize;

  const CustomGroupedImgCarousel(
      {super.key,
      required this.users,
      required this.title,
      required this.onIconPressed,
      this.titleColor,
      this.thumbnailColor,
      this.marginStart,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomLabelButton(
            marginLeft: marginStart ?? kDefaultPadding,
            marginRight: kDefaultPadding,
            marginTop: 0,
            marginBottom: 0,
            title: title,
            color: titleColor,
            fontSize: fontSize ?? fontSizeModerate,
            onPressed: onIconPressed,
            icon: Icons.more_horiz),
        CustomImgScrollCarousel(
            users: users, marginStart: 0, textColor: thumbnailColor),
      ],
    );
  }
}
