import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/widgets/custom_label_btn.dart';

import '../model/user.dart';
import '../redux/appstate.dart';
import '../utility/constants.dart';
import '../widgets/custom_grouped_img_carousel.dart';
import '../widgets/custom_pdt_carousel.dart';

class MarketProduct extends StatelessWidget {
  const MarketProduct({super.key});

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
                title: 'Favorites',
                onIconPressed: () {},
                titleColor: primaryColorLight,
                thumbnailColor:
                    themeState.isDarkMode ? accentColorLight : textColorLight,
              ),
            ),
          ),
          CustomLabelButton(
              color: primaryColorLight,
              title: 'Products',
              onPressed: () {},
              icon: Icons.search),
          const CustomProductCarousel()
        ],
      ),
    );
    ;
  }
}
