import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/widgets/custom_text_box.dart';
import '../utility/constants.dart';

class CustomItemCard extends StatelessWidget {
  final String thumbnail;
  final String title;
  final String subtitle;
  final bool isFavorite;
  final double? discount;
  final double favorites;
  final VoidCallback onPressed;
  final VoidCallback onFavoritePressed;

  const CustomItemCard({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.isFavorite,
    this.discount,
    required this.favorites,
    required this.onPressed,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.all(kDefaultPadding * 0.5),
          child: Column(children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.all(Radius.circular(kDefaultRadius)),
                child: Container(
                  height: 250,
                  width: 180,
                  decoration: const BoxDecoration(
                    color: accentGreyBg,
                    borderRadius:
                        BorderRadius.all(Radius.circular(kDefaultRadius)),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        thumbnail,
                        fit: BoxFit.cover,
                      ),
                      (discount != null)
                          ? Positioned(
                              top: 5,
                              right: 5,
                              child: CustomTextBox(
                                  text: '${discount!.toInt().toString()}%'),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: kDefaultPadding * 0.3,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: themeState.isDarkMode
                        ? primaryColorLight
                        : textColorLight,
                    fontSize: fontSizeSmall,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: kDefaultPadding * 0.05,
                ),
                SizedBox(
                  width: 180,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          subtitle,
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: fontSizeSmall,
                              fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Center(
                        child: CustomFavoriteButton(
                          isFavorite: isFavorite,
                          favorites: favorites,
                          radius: 48,
                          onFavoritePressed: onFavoritePressed,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class CustomFavoriteButton extends StatelessWidget {
  const CustomFavoriteButton({
    Key? key,
    required this.isFavorite,
    required this.radius,
    required this.favorites,
    required this.onFavoritePressed,
  }) : super(key: key);

  final bool isFavorite;
  final double favorites;
  final double radius;
  final VoidCallback onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => GestureDetector(
        onTap: onFavoritePressed,
        child: Container(
          padding: const EdgeInsets.all(kDefaultPadding * 0.3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              color: accentColorLight),
          child: Row(
            children: [
              const Icon(
                Icons.shopping_basket_outlined,
                color: primaryColorLight,
                size: 24,
              ),
              const SizedBox(
                width: kDefaultPadding * 0.1,
              ),
              Text(
                favorites.toInt().toString(),
                style: TextStyle(
                  fontSize: fontSizeSmall,
                  color:
                      themeState.isDarkMode ? accentColorLight : textColorLight,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
