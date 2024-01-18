import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ionicons/ionicons.dart';
import 'package:spyke/scenes/preview/preview_page.dart';
import 'package:spyke/utility/app_navigation.dart';
import 'package:spyke/utility/constants.dart';

class ProfileDialog extends StatelessWidget {
  final String imgUrl;
  final String title;

  const ProfileDialog({Key? key, required this.imgUrl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: _buildChild(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(kDefaultRadius)),
      ),
    );
  }

  _buildChild(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(kDefaultRadius)),
      child: Container(
          height: dialogHeight,
          decoration: const BoxDecoration(
            color: primaryColorDark,
            borderRadius: BorderRadius.all(Radius.circular(kDefaultRadius)),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              GestureDetector(
                onTap: () {
                  nextSceneWithAnim(
                      nextScene: PreviewPage(
                    mediaUrl: [imgUrl],
                    showButtomThumbnail: false,
                    title: title,
                  ));
                  
                },
                child: Image.asset(
                  imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildDecoration(
                    child: _buildHeaderTitle(),
                  ),
                  _buildDecoration(child: _buildActions()),
                ],
              )
            ],
          )),
    );
  }

  Text _buildHeaderTitle() {
    return Text(
      title,
      style: const TextStyle(
        fontSize: fontSizeModerate,
        fontWeight: FontWeight.bold,
        color: accentColorLight,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      textAlign: TextAlign.center,
    );
  }

  Row _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            tooltip: 'Chat',
            onPressed: () {},
            icon: const Icon(
              Ionicons.chatbubbles_outline,
              size: kDefaultIconSize,
              color: accentColorLight,
            )),
        IconButton(
            tooltip: 'Voice call',
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.phoneCall,
              size: kDefaultIconSize,
              color: accentColorLight,
            )),
        IconButton(
            tooltip: 'Video call',
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.video,
              size: kDefaultIconSize,
              color: accentColorLight,
            )),
        IconButton(
            tooltip: 'Info',
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.info,
              size: kDefaultIconSize,
              color: accentColorLight,
            )),
      ],
    );
  }

  Container _buildDecoration({required Widget child}) {
    return Container(
      height: 48,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(kOpacity),
      ),
      child: child,
    );
  }
}
