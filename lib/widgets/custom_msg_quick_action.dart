import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import 'package:spyke/model/message.dart';
import 'package:spyke/redux/appstate.dart';

import '../utility/constants.dart';

class CustomMessageQuickAction extends StatelessWidget {
  final Message message;

  const CustomMessageQuickAction({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Ionicons.share_social,
              color: message.isPinned
                  ? Colors.orange
                  : themeState.isDarkMode
                      ? accentColorLight
                      : textColorLight,
              size: 24,
            ),
          ),
          const SizedBox(
            height: kDefaultPadding * 0.5,
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.reply,
              color: themeState.isDarkMode ? accentColorLight : textColorLight,
              size: 24,
            ),
          )
        ],
      ),
    );
  }
}
