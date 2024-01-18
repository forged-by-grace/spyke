import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/model/store.dart';

import '../model/user.dart';
import '../redux/appstate.dart';
import '../utility/constants.dart';
import '../widgets/custom_grouped_img_carousel.dart';
import '../widgets/custom_item_card.dart';
import '../widgets/custom_label_btn.dart';

class MarketStore extends StatelessWidget {
  const MarketStore({super.key});

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
                title: 'Favorite Stores',
                onIconPressed: () {},
                titleColor: primaryColorLight,
                thumbnailColor:
                    themeState.isDarkMode ? accentColorLight : textColorLight,
              ),
            ),
          ),
          CustomLabelButton(
              color: primaryColorLight,
              title: 'Stores',
              onPressed: () {},
              icon: Icons.search),
          Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding * 3.5),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  mainAxisSpacing: kDefaultPadding,
                  childAspectRatio: 0.8),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              itemCount: stores.length,
              itemBuilder: ((context, index) => CustomItemCard(
                    thumbnail: stores[index].thumbnail,
                    title: stores[index].title,
                    subtitle: stores[index].categories,
                    favorites: stores[index].favorites,
                    isFavorite: stores[index].isFavorite,
                    onFavoritePressed: () {},
                    onPressed: () {},
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
