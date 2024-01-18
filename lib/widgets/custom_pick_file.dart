import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/redux/appstate.dart';

import '../utility/constants.dart';

class CustomPickFile extends StatelessWidget {
  final VoidCallback onCancel;

  const CustomPickFile({super.key, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 180,
        child: Stack(children: [
          Positioned(
            top: kDefaultPadding * 2,
            left: kDefaultPadding * 0.5,
            bottom: kDefaultPadding * 0.5,
            right: kDefaultPadding * 0.5,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MediaPickerWidget(
                      onPressed: () {},
                      icon: FeatherIcons.camera,
                      title: 'Camera'),
                  MediaPickerWidget(
                      onPressed: () {}, icon: Icons.photo, title: 'Gallery'),
                  MediaPickerWidget(
                      onPressed: () {},
                      icon: FeatherIcons.fileText,
                      title: 'Document'),
                ]),
          ),
          StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (_, themeState) => Positioned(
                  top: kDefaultPadding * 0.5,
                  right: kDefaultPadding * 0.5,
                  child: GestureDetector(
                      onTap: onCancel,
                      child: Icon(
                        Icons.cancel,
                        color: themeState.isDarkMode
                            ? primaryColorLight
                            : textColorLight,
                      ))))
        ]));
  }
}

class MediaPickerWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String title;

  const MediaPickerWidget({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 150,
        width: 75,
        child: Column(
          children: [
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (_, themeState) => ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(kDefaultImageRadius * 2)),
                child: Container(
                  height: kDefaultImageRadius * 2,
                  width: kDefaultImageRadius * 2,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(kDefaultPadding * 0.5),
                  decoration: BoxDecoration(
                    gradient: themeState.isDarkMode
                        ? kBackgroundLight
                        : kMediaPickerBgLight,
                    borderRadius: const BorderRadius.all(
                        Radius.circular(kDefaultImageRadius * 2)),
                  ),
                  child: Icon(
                    icon,
                    size: 24,
                    color: themeState.isDarkMode
                        ? textColorLight
                        : accentColorLight,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: kDefaultPadding * 0.5,
            ),
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (_, themeState) => Text(
                title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: themeState.isDarkMode
                      ? primaryColorLight
                      : textColorLight,
                  fontSize: fontSizeModerate,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
