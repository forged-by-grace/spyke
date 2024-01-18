import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:spyke/scenes/chat_scene.dart';
import 'package:spyke/scenes/friends.dart';
import 'package:spyke/utility/app_navigation.dart';

import '../redux/appstate.dart';
import '../utility/constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => ClipRRect(
        borderRadius:
            const BorderRadius.all(Radius.circular(kDefaultImageRadius * 3)),
        child: Card(
          shadowColor: themeState.isDarkMode
              ? accentColorDark
              : Colors.black.withOpacity(.5),
          elevation: kDefaultElevation,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(kDefaultImageRadius * 3))),
          child: Container(
            decoration: BoxDecoration(
              color: themeState.isDarkMode
                  ? primaryColorDark
                  : bottomNavBarColorLight,
              borderRadius: const BorderRadius.all(
                  Radius.circular(kDefaultImageRadius * 3)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GNav(
                  color: themeState.isDarkMode
                      ? accentColorLight
                      : accentColorDark,
                  textSize: fontSizeSmall,
                  gap: kDefaultPadding * 0.5,
                  tabBackgroundColor: themeState.isDarkMode
                      ? accentColorDark
                      : accentColorLight,
                  padding: const EdgeInsets.all(kDefaultPadding * 0.5),
                  activeColor: primaryColorLight,
                  backgroundColor: themeState.isDarkMode
                      ? primaryColorDark
                      : bottomNavBarColorLight,
                  iconSize: kDefaultIconSize,
                  onTabChange: (index) {
                    changeScene(index);
                  },
                  tabs: const [
                    GButton(
                      icon: Ionicons.chatbubbles_outline,
                      text: 'Chat',
                    ),
                    GButton(
                      icon: Icons.people_outline,
                      text: 'Friends',
                    ),
                    GButton(
                      icon: Ionicons.people_outline,
                      text: 'Rooms',
                    ),
                    GButton(
                      icon: FontAwesomeIcons.opencart,
                      text: 'Market',
                    ),
                    GButton(
                      icon: Icons.person_outline,
                      text: 'Profile',
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  void changeScene(int index) {
    switch (index) {
      case 0:
        replaceSceneWithAnim(nextScene: const ChatScene());
        break;
      case 1:
        replaceSceneWithAnim(nextScene: const FriendsScene());
        break;
    }
  }
}
