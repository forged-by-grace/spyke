import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/helper/dialog_helper.dart';
import 'package:spyke/model/chat.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/scenes/direct_msg.dart';
import 'package:spyke/utility/app_navigation.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/custom_chat_tile.dart';
import 'package:spyke/widgets/custom_grouped_img_carousel.dart';
import 'package:spyke/widgets/custom_label_btn.dart';
import 'package:spyke/widgets/custom_scafford_bg.dart';

import '../model/user.dart';

class ChatScene extends StatelessWidget {
  const ChatScene({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Scaffold(
        appBar: AppBar(
          systemOverlayStyle: statusBarStyleLight,
          elevation: 0,
          backgroundColor:
              themeState.isDarkMode ? primaryColorDark : primaryColorLight,
          title: customTitle(title: appName),
          centerTitle: true,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: kDefaultPadding),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  themeState.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: themeState.isDarkMode
                      ? primaryColorLight
                      : accentColorLight,
                ),
              ),
            ),
          ],
        ),
        body: CustomScaffordBackground(child: chatSceneBody(context)),
        backgroundColor:
            themeState.isDarkMode ? accentColorDark : accentColorLight,
      ),
    );
  }
}

Widget chatSceneBody(BuildContext context) {
  return Column(
    children: [
      ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(kDefaultRadius * 1.5),
          bottomRight: Radius.circular(kDefaultRadius * 1.5),
        ),
        child: Material(
          elevation: kDefaultElevation,
          child: StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (_, themeState) => Container(
              padding: const EdgeInsets.only(bottom: kDefaultPadding),
              decoration: BoxDecoration(
                color: themeState.isDarkMode
                    ? primaryColorDark
                    : primaryColorLight,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(kDefaultRadius * 1.5),
                  bottomRight: Radius.circular(kDefaultRadius * 1.5),
                ),
              ),
              child: CustomGroupedImgCarousel(
                users: users,
                title: 'Active now',
                onIconPressed: () => DialogHelper.showProfile(
                    context: context,
                    imgUrl: 'assets/images/b4.jpg',
                    title: 'James Nornubari'),
              ),
            ),
          ),
        ),
      ),
      CustomLabelButton(
        icon: Icons.search_outlined,
        title: 'Recent chats',
        color: primaryColorLight,
        onPressed: () {},
        marginLeft: kDefaultPadding,
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(bottom: kDefaultPadding * 3.5),
          child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: ((context, index) => CustomChatTile(
                    profileImgUrl: chats[index].profileImg.toString(),
                    name: chats[index].name.toString(),
                    timeStamp:
                        chats[index].lastMessage!['timestamp'].toString(),
                    message: chats[index].lastMessage!['message'].toString(),
                    unreadMessages: chats[index].unreadMessages!,
                    onProfileImgPressed: () => DialogHelper.showProfile(
                        context: context,
                        imgUrl: chats[index].profileImg.toString(),
                        title: chats[index].name.toString()),
                    onPressed: () => nextSceneWithAnim(
                        nextScene: DirectMessage(
                      title: chats[index].name.toString(),
                      isOnline: true,
                    )),
                  ))),
        ),
      ),
    ],
  );
}
