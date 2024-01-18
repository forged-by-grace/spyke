import 'package:flutter/material.dart';

import '../model/product.dart';
import '../utility/constants.dart';
import 'custom_item_card.dart';

class CustomProductCarousel extends StatelessWidget {
  const CustomProductCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 3.5),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            mainAxisSpacing: kDefaultPadding,
            childAspectRatio: 0.6),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        itemCount: products.length,
        itemBuilder: ((context, index) => CustomItemCard(
              thumbnail: products[index].thumbnail,
              title: products[index].title,
              subtitle: '${formatCurrency(products[index].price)}',
              discount: products[index].discountPercentage,
              isFavorite: products[index].isFavorite,
              favorites: 40,
              onPressed: () {},
              onFavoritePressed: () {},
            )),
      ),
    );
  }
}
