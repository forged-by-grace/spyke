import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/custom_scafford_bg.dart';
import 'package:spyke/widgets/custom_title_appbar.dart';

import '../model/user.dart';
import '../widgets/custom_chat_tile.dart';
import '../widgets/custom_grouped_img_carousel.dart';
import '../widgets/custom_label_btn.dart';

class FriendsScene extends StatelessWidget {
  const FriendsScene({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Scaffold(
        backgroundColor:
            themeState.isDarkMode ? accentColorDark : accentColorLight,
        body: CustomScaffordBackground(child: friendsBody(context)),
      ),
    );
  }

  friendsBody(BuildContext context) {
    return Column(
      children: [
        const CustomTitleAppbar(
          title: 'Friends',
          actionIcon: Icon(
            Icons.person_add,
            color: accentColorLight,
            size: 24,
          ),
        ),
        StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (_, themeState) => Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding),
            child: CustomGroupedImgCarousel(
              users: users,
              title: 'Favorites',
              onIconPressed: () {},
              titleColor: primaryColorLight,
              thumbnailColor:
                  themeState.isDarkMode ? accentColorLight : textColorLight,
            ),
          ),
        ),
        CustomLabelButton(
          icon: Icons.search_outlined,
          title: 'Contacts',
          color: primaryColorLight,
          onPressed: () {},
          marginLeft: kDefaultPadding,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding * 3.5),
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: ((context, index) => CustomChatTile(
                    profileImgUrl: users[index].imgUrl.toString(),
                    name: users[index].fullname.toString(),
                    message: users[index].about.toString(),
                    onProfileImgPressed: () {},
                    onPressed: () {},
                    child: GestureDetector(
                      onTap: () {},
                      child: (users[index].isFavorite != null &&
                              users[index].isFavorite!)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 24,
                            )
                          : StoreConnector<AppState, AppState>(
                              converter: (store) => store.state,
                              builder: (_, themeState) => Icon(
                                    Icons.favorite_border,
                                    color: themeState.isDarkMode
                                        ? accentColorLight
                                        : textColorLight,
                                    size: 24,
                                  )),
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
