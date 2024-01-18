import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:spyke/enum/dm_menu_tem.dart';
import 'package:spyke/enum/online_status.dart';
import 'package:spyke/model/message.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/scenes/room_description_dart/room_description_page.dart';
import 'package:spyke/utility/app_navigation.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/custom_dm_header.dart';
import 'package:spyke/widgets/custom_dp_with_indicator.dart';
import 'package:spyke/widgets/custom_icon_name.dart';
import 'package:spyke/widgets/custom_msg_editor.dart';
import 'package:spyke/widgets/custom_title_with_indicator.dart';
import 'package:spyke/widgets/message_card.dart';

class DirectMessage extends StatelessWidget {
  final String title;
  final bool? isOnline;

  const DirectMessage({
    super.key,
    required this.title,
    this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: statusBarStyleLight,
      child: Scaffold(
        body: directMessageBody(context),
      ),
    );
  }

  directMessageBody(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(fit: StackFit.expand, children: [
        Image.asset(
          'assets/images/chat_bg/c2.jpg',
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (_, themeState) => DirectMessageAppBar(
                title: title,
                isOnline: true,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
                      child: ListView.builder(
                        itemCount: messages.length,                        
                        itemBuilder: (context, index) => MessageCard(message: messages[index], currentIndex: index, stillSender: false),
                        ),
                    ),
                  ),
                  const CustomMessageEditor(),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

class DirectMessageAppBar extends StatelessWidget {
  const DirectMessageAppBar({
    Key? key,
    required this.title,
    this.isOnline,
    this.bgColor,
  }) : super(key: key);

  final String title;
  final bool? isOnline;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(kDefaultRadius),
            bottomRight: Radius.circular(kDefaultRadius)),
        child: Container(
          decoration: BoxDecoration(
            color: bgColor != null
                ? bgColor!
                : themeState.isDarkMode
                    ? accentColorDark
                    : primaryColorLight,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(kDefaultRadius),
                bottomRight: Radius.circular(kDefaultRadius)),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: kDefaultPadding * 0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: kDefaultPadding * 0.5,
                      ),
                      GestureDetector(
                        onTap: () => previousScene(),
                        child: Icon(
                          Icons.arrow_back,
                          color: themeState.isDarkMode
                              ? primaryColorLight
                              : accentColorLight,
                          size: defaultIconSize,
                        ),
                      ),
                      const SizedBox(
                        width: kDefaultPadding * 0.5,
                      ),
                      CustomDpWithIndicator(
                        onlineStatus: OnlineStatus.active.index,
                        radius: kDefaultImageRadius,
                      ),
                      const SizedBox(
                        width: kDefaultPadding * 0.5,
                      ),
                      customTitle(title: title),
                    ],
                  ),
                  _buildMenu(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildMenu(BuildContext context) => PopupMenuButton(
      onSelected: (value) {
        switch (value) {
          case DmMenuItem.block:
            print('Block  was clicked');

            break;
          case DmMenuItem.call:
            print('Call was clicked');

            break;
          case DmMenuItem.favourite:
            print('Favourite was clicked');

            break;
          case DmMenuItem.info:
            nextScene(nextScene: RoomDescription(title: title));
            print('Info was clicked');
            break;
          case DmMenuItem.search:
            print('Search was clicked');

            break;
          case DmMenuItem.share:
            print('share was clicked');

            break;
        }
      },
      padding: const EdgeInsets.all(kDefaultPadding * 0.2),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius)),
      itemBuilder: (BuildContext context) => [
            const PopupMenuItem(
              value: DmMenuItem.share,
              child: CustomIconName(
                icon: Icons.share,
                title: 'Share',
                color: textColorLight,
              ),
            ),
            const PopupMenuItem(
              value: DmMenuItem.search,
              child: CustomIconName(
                icon: Icons.search,
                title: 'Search',
                color: textColorLight,
              ),
            ),
            const PopupMenuItem(
              value: DmMenuItem.favourite,
              child: CustomIconName(
                icon: Icons.favorite_outline,
                title: 'Make favourite',
                color: textColorLight,
              ),
            ),
            const PopupMenuItem(
              value: DmMenuItem.call,
              child: CustomIconName(
                icon: FeatherIcons.phoneCall,
                title: 'Call',
                color: textColorLight,
              ),
            ),
            const PopupMenuItem(
              value: DmMenuItem.block,
              child: CustomIconName(
                icon: Icons.block,
                title: 'Block',
                color: textColorLight,
              ),
            ),
            const PopupMenuItem(
              value: DmMenuItem.info,
              child: CustomIconName(
                icon: FeatherIcons.info,
                title: 'Info',
                color: textColorLight,
              ),
            ),
          ]);
}
