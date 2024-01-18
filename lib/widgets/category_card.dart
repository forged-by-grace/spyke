import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/model/category.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/custom_box_img.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final bool isMainCategory;

  const CategoryCard(
      {super.key, required this.category, required this.isMainCategory});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (isMainCategory)
              ? Expanded(
                  child: CustomBoxImage(
                    url: category.thumbnail,
                    height: 120,
                    width: 120,
                    marginRight: 0,
                    cornerRadius: kDefaultRadius,
                    backgroundColor: accentColorLight,
                  ),
                )
              : Expanded(
                  child: CustomBoxImage(
                    url: category.thumbnail,
                    height: 100,
                    width: 100,
                    marginRight: 0,
                    cornerRadius: kDefaultRadius,
                    backgroundColor: accentColorLight,
                  ),
                ),
          StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (_, themeState) => Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding * 0.2),
              child: Text(
                category.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: (isMainCategory)
                      ? accentColorLight
                      : themeState.isDarkMode
                          ? accentColorLight
                          : textColorLight,
                  fontSize: fontSizeSmall,
                  fontWeight:
                      (isMainCategory) ? FontWeight.w600 : FontWeight.normal,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
