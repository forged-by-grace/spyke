import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spyke/model/slide.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/widgets/illustration.dart';
import 'package:spyke/widgets/responsive.dart';

import '../utility/constants.dart';

class SlideItem extends StatelessWidget {
  final int index;

  const SlideItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final slide = slideList[index];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IllustrationWidget(
          imgUrl: slide.imgUrl,
        ),
        (slide.title != null)
            ? Container(
                margin: const EdgeInsets.only(top: kDefaultPadding),
                child: Text(
                  slide.title ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColorDark,
                    fontSize: fontSizeModerate,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        const SizedBox(
          height: kDefaultPadding * 0.5,
        ),
        (slide.description != null)
            ? StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                builder: (_, themeState) => Text(
                  slide.description ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: themeState.isDarkMode
                        ? accentColorLight
                        : textColorLight,
                    fontSize: fontSizeSmall,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        const SizedBox(
          height: kDefaultPadding * 0.5,
        ),
      ],
    );
  }
}
