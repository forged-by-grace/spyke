import 'package:flutter/material.dart';
import 'package:spyke/model/category.dart';
import 'package:spyke/widgets/category_card.dart';

import '../utility/constants.dart';

class MarketCategory extends StatelessWidget {
  const MarketCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.only(bottom: kDefaultPadding * 3.5),
            color: primaryColorLight,
            child: ListView.builder(
              itemCount: mainCategories.length,
              itemExtent: 120,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding * 0.5,
                    horizontal: kDefaultPadding * 0.2),
                child: CategoryCard(
                    category: mainCategories[index], isMainCategory: true),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            margin: const EdgeInsets.all(kDefaultPadding * 0.5),
            padding: const EdgeInsets.only(bottom: kDefaultPadding * 3.5),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: kCrossExtent,
                mainAxisSpacing: kDefaultPadding * 0.5,
                childAspectRatio: kChildAspectRatio,
              ),
              itemCount: superSubCategories.length,
              itemBuilder: ((context, index) => CategoryCard(
                  category: superSubCategories[index], isMainCategory: false)),
            ),
          ),
        )
      ],
    );
  }
}
