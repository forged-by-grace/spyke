import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import 'package:spyke/model/order.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/custom_divider.dart';
import 'package:spyke/widgets/custom_image_button.dart';
import 'package:spyke/widgets/custom_scafford_bg.dart';
import 'package:spyke/widgets/order_card.dart';

import '../model/user.dart';
import '../widgets/custom_grouped_img_carousel.dart';
import '../widgets/custom_label_btn.dart';

class ProfileScene extends StatelessWidget {
  const ProfileScene({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: statusBarStyleLight,
        elevation: 0,
        title: customTitle(title: 'Profile'),
      ),
      body: CustomScaffordBackground(child: profileBody(context)),
    );
  }

  profileBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomProfileThumbnail(context),
          CustomText(
              prefixIcon: Ionicons.person_outline,
              title: 'James Nornubari Confidence',
              suffixIcon: Icons.edit,
              onSuffixIconPressed: () {}),
          CustomText(
              prefixIcon: Ionicons.mail_outline,
              title: 'nornubariconfidence@gmail.com',
              suffixIcon: Icons.edit,
              onSuffixIconPressed: () {}),
          CustomText(
              prefixIcon: Ionicons.call_outline,
              title: '+234 (0)915 7547 321',
              suffixIcon: Icons.edit,
              onSuffixIconPressed: () {}),
          CustomText(
              prefixIcon: Ionicons.log_out_outline,
              title: 'Log out',
              onPrefixIconPressed: () {}),
          StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (_, themeState) => Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: CustomDivider(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: themeState.isDarkMode
                      ? primaryColorLight
                      : textColorLight),
            ),
          ),
          StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (_, themeState) => CustomGroupedImgCarousel(
              users: users,
              title: 'My stores',
              onIconPressed: () {},
              titleColor: primaryColorLight,
              thumbnailColor:
                  themeState.isDarkMode ? accentColorLight : textColorLight,
            ),
          ),
          StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (_, themeState) => Padding(
              padding: const EdgeInsets.only(
                  left: kDefaultPadding,
                  top: kDefaultPadding * 2,
                  bottom: kDefaultPadding,
                  right: kDefaultPadding),
              child: CustomDivider(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: themeState.isDarkMode
                      ? primaryColorLight
                      : textColorLight),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: kDefaultPadding, right: kDefaultPadding * 0.5),
            child: CustomLabelButton(
              color: primaryColorLight,
              title: 'My orders',
              onPressed: () {},
              icon: Icons.search,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding * 3.5),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                itemCount: orders.length,
                itemBuilder: (context, index) =>
                    OrderCard(order: orders[index])),
          )
        ],
      ),
    );
  }

  CustomProfileThumbnail(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(
              top: 20,
              left: 0,
              right: 35,
              bottom: 0,
              child: CustomCircularImageButton(url: 'assets/images/b1.jpg')),
          Positioned(
            top: 10,
            right: 5,
            child: StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (_, themeState) => IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  size: 24,
                  color:
                      themeState.isDarkMode ? accentColorLight : textColorLight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  CustomText(
      {required IconData prefixIcon,
      required String title,
      IconData? suffixIcon,
      Color? color,
      VoidCallback? onPrefixIconPressed,
      VoidCallback? onSuffixIconPressed}) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding * 0.5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: onPrefixIconPressed,
                child: Icon(
                  prefixIcon,
                  color: (color != null)
                      ? color
                      : themeState.isDarkMode
                          ? accentColorLight
                          : textColorLight,
                  size: 24,
                )),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                    color: (color != null)
                        ? color
                        : themeState.isDarkMode
                            ? accentColorLight
                            : textColorLight,
                    fontSize: fontSizeSmall,
                    fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              width: kDefaultPadding,
            ),
            (suffixIcon != null)
                ? GestureDetector(
                    onTap: onSuffixIconPressed,
                    child: Icon(
                      suffixIcon,
                      color: (color != null)
                          ? color
                          : themeState.isDarkMode
                              ? accentColorLight
                              : textColorLight,
                      size: 24,
                    ))
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
