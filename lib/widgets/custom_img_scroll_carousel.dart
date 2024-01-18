import 'package:flutter/material.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/custom_img_thumbnail.dart';

import '../model/user.dart';

class CustomImgScrollCarousel extends StatelessWidget {
  final List<User> users;
  final Color? textColor;
  final double? marginStart;

  const CustomImgScrollCarousel(
      {super.key, this.marginStart, required this.users, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(left: kDefaultPadding * 0.5),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemExtent: kCircularIconListExtent,
        itemBuilder: ((context, index) => CustomImageThumbnail(
              textColor: textColor,
              onPressed: () {},
              title: users[index].fullname ?? '',
              imgUrl: users[index].imgUrl ?? '',
            )),
      ),
    );
  }
}
