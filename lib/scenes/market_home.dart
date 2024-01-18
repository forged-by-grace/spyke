import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/widgets/custom_box_carousel.dart';
import 'package:spyke/widgets/custom_divider.dart';
import 'package:spyke/widgets/custom_item_card.dart';

import '../model/product.dart';
import '../model/user.dart';
import '../redux/appstate.dart';
import '../utility/constants.dart';
import '../widgets/custom_grouped_img_carousel.dart';
import '../widgets/custom_pdt_carousel.dart';

class MarketHome extends StatelessWidget {
  const MarketHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (_, themeState) => Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding),
              child: CustomGroupedImgCarousel(
                users: users,
                title: 'Best Selling Stores',
                onIconPressed: () {},
                titleColor: primaryColorLight,
                thumbnailColor:
                    themeState.isDarkMode ? accentColorLight : textColorLight,
              ),
            ),
          ),
          StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (_, themeState) => Padding(
              padding: const EdgeInsets.only(
                  left: kDefaultPadding, top: kDefaultPadding * 0.5),
              child: CustomDivider(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: themeState.isDarkMode
                      ? accentColorLight
                      : textColorLight),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 0.5),
            child: CustomBoxCarousel(items: [
              'Recommended',
              'Shirts',
              'Polos',
              'Grocery',
              'Beef',
              'Cremery',
            ]),
          ),
          StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (_, themeState) => Padding(
              padding: const EdgeInsets.only(
                  left: kDefaultPadding, bottom: kDefaultPadding),
              child: CustomDivider(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: themeState.isDarkMode
                      ? accentColorLight
                      : textColorLight),
            ),
          ),
          const CustomProductCarousel()
        ],
      ),
    );
  }
}
