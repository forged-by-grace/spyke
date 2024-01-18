import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/model/product.dart';
import 'package:spyke/model/user.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/scenes/Media.dart';
import 'package:spyke/utility/app_navigation.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/custom_box_img_carousel.dart';
import 'package:spyke/widgets/custom_divider.dart';
import 'package:spyke/widgets/custom_grouped_img_carousel.dart';
import 'package:spyke/widgets/custom_label_btn.dart';
import 'package:spyke/widgets/custom_scafford_bg.dart';

import '../../widgets/custom_chat_tile.dart';
import '../../widgets/custom_icon_name.dart';

class RoomDescription extends StatelessWidget {
  final String title;

  const RoomDescription({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: true,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: customTitle(title: title),
              centerTitle: true,
              collapseMode: CollapseMode.pin,
              background: Image.network(
                  'https://images.unsplash.com/photo-1483721310020-03333e577078?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1856&q=80'),
            ),
            actions: [
              PopupMenuButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kDefaultRadius)),
                  itemBuilder: (context) => [
                        const PopupMenuItem(
                            child: CustomIconName(
                                icon: Icons.share, title: 'Share')),
                        const PopupMenuItem(
                            child: CustomIconName(
                                icon: Icons.close, title: 'Exit')),
                      ])
            ],
          ),
          SliverToBoxAdapter(
            child: CustomScaffordBackground(
              child: _buildRoomBody(context),
            ),
          ),
        ],
      )),
    );
  }

  _buildRoomBody(BuildContext context) => Container(
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildAuthorInfo(context),
            const SizedBox(
              height: kDefaultPadding,
            ),
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (_, themeState) => CustomDivider(
                  width: MediaQuery.of(context).size.width,
                  height: kDividerThickness,
                  color: themeState.isDarkMode
                      ? accentColorLight
                      : textColorLight),
            ),
            _buildDescription(context),
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (_, themeState) => CustomDivider(
                  width: MediaQuery.of(context).size.width,
                  height: kDividerThickness,
                  color: themeState.isDarkMode
                      ? accentColorLight
                      : textColorLight),
            ),
            _buildAdmin(context),
            const SizedBox(
              height: kDefaultPadding,
            ),
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (_, themeState) => CustomDivider(
                  width: MediaQuery.of(context).size.width,
                  height: kDividerThickness,
                  color: themeState.isDarkMode
                      ? accentColorLight
                      : textColorLight),
            ),
            _buildMedia(context),
            const SizedBox(
              height: kDefaultPadding * 0.5,
            ),
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (_, themeState) => CustomDivider(
                  width: MediaQuery.of(context).size.width,
                  height: kDividerThickness,
                  color: themeState.isDarkMode
                      ? accentColorLight
                      : textColorLight),
            ),
            _buildParticipants(context),
          ],
        ),
      ));

  _buildAuthorInfo(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(title: 'Author'),
          const SizedBox(
            height: kDefaultPadding,
          ),
          CustomIconName(title: users[0].fullname!, icon: Icons.person_outline),
          const SizedBox(
            height: kDefaultPadding,
          ),
          CustomIconName(title: users[0].email!, icon: FeatherIcons.mail),
          const SizedBox(
            height: kDefaultPadding,
          ),
          CustomIconName(title: users[0].mobile!, icon: FeatherIcons.phone),
        ],
      );

  Text _buildTitle({required String title}) {
    return Text(
      title,
      textAlign: TextAlign.start,
      style: const TextStyle(
          fontSize: fontSizeModerate,
          color: primaryColorLight,
          fontWeight: FontWeight.bold),
    );
  }

  _buildDescription(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(title: 'Description'),
            const SizedBox(
              height: kDefaultPadding * 0.5,
            ),
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (_, themeState) => Text(
                'This room was created to link buyers and sellers together',
                style: TextStyle(
                  fontSize: fontSizeSmall,
                  height: 1.5,
                  color:
                      themeState.isDarkMode ? accentColorLight : textColorLight,
                ),
              ),
            )
          ],
        ),
      );

  _buildAdmin(BuildContext context) => CustomGroupedImgCarousel(
        users: users,
        title: 'Admins',
        onIconPressed: () {},
        titleColor: primaryColorLight,
        thumbnailColor: textColorLight,
        fontSize: fontSizeModerate,
        marginStart: 0,
      );

  _buildParticipants(BuildContext context) => Column(
        children: [
          const SizedBox(
            height: kDefaultPadding * 0.5,
          ),
          CustomLabelButton(
            color: primaryColorLight,
            title: (users.length > 1)
                ? '${users.length} participants'
                : '${users.length} participant',
            onPressed: () {},
            icon: Icons.search,
          ),
          const SizedBox(
            height: kDefaultPadding * 0.5,
          ),
          ListView.builder(
            itemCount: users.length,
            primary: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) => CustomChatTile(
                  profileImgUrl: users[index].imgUrl.toString(),
                  name: users[index].fullname.toString(),
                  message: users[index].about.toString(),
                  horizontalMargin: 0,
                  onProfileImgPressed: () {},
                  onPressed: () {},
                  child: IconButton(
                    tooltip: 'Toggle favorite',
                    onPressed: () {},
                    icon: (users[index].isFavorite != null &&
                            users[index].isFavorite!)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 24,
                          )
                        : StoreConnector<AppState, AppState>(
                            converter: (store) => store.state,
                            builder: (_, themeState) => const Icon(
                                  Icons.add,
                                  color: primaryColorLight,
                                  size: kDefaultIconSize,
                                )),
                  ),
                )),
          )
        ],
      );

  _buildMedia(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Column(children: [
          CustomLabelButton(
              color: primaryColorLight,
              title: 'Media',
              onPressed: () => nextScene(nextScene: Media(title: title)),
              icon: Icons.more_horiz),
          CustomBoxImgCarousel(urls: products.map((e) => e.thumbnail).toList())
        ]),
      );
}
