import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:spyke/scenes/chat_scene.dart';
import 'package:spyke/scenes/friends.dart';
import 'package:spyke/scenes/market.dart';
import 'package:spyke/scenes/profile.dart';
import 'package:spyke/scenes/rooms.dart';
import 'package:spyke/widgets/custom_bottom_nav.dart';

import '../redux/appstate.dart';
import '../utility/constants.dart';

class HomeScene extends StatefulWidget {
  const HomeScene({super.key});

  @override
  State<HomeScene> createState() => _HomeSceneState();
}

class _HomeSceneState extends State<HomeScene> {
  int currentScene = 0;

  final scenes = [
    const ChatScene(),
    const FriendsScene(),
    const RoomScene(),
    const MarketScene(),
    const ProfileScene(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        scenes[currentScene],
        Positioned(
          bottom: kDefaultPadding * 0.5,
          left: kDefaultPadding * 0.5,
          right: kDefaultPadding * 0.5,
          child: buildBottomNav(),
        )
      ]),
    );
  }

  Widget buildBottomNav() {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => ClipRRect(
        borderRadius:
            const BorderRadius.all(Radius.circular(kDefaultImageRadius)),
        child: Card(
          shadowColor: themeState.isDarkMode
              ? accentColorDark
              : Colors.black.withOpacity(.5),
          elevation: kDefaultElevation,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(kDefaultImageRadius))),
          child: Container(
            decoration: BoxDecoration(
              color: themeState.isDarkMode
                  ? primaryColorDark
                  : bottomNavBarColorLight,
              borderRadius:
                  const BorderRadius.all(Radius.circular(kDefaultImageRadius)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GNav(
                  color:
                      themeState.isDarkMode ? accentColorLight : textColorLight,
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
                    setState(() {
                      currentScene = index;
                    });
                  },
                  tabs: const [
                    GButton(
                      icon: Ionicons.chatbubble_outline,
                      text: 'Chat',
                    ),
                    GButton(
                      icon: Icons.people_outline,
                      text: 'Friends',
                    ),
                    GButton(
                      icon: FontAwesomeIcons.peopleGroup,
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
}
