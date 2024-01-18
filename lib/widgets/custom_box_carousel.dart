import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/utility/constants.dart';

import 'custom_box.dart';

class CustomBoxCarousel extends StatefulWidget {
  final List<String> items;
  final double? cornerRadius;

  const CustomBoxCarousel({super.key, this.cornerRadius, required this.items});

  @override
  State<CustomBoxCarousel> createState() => _CustomBoxCarouselState();
}

class _CustomBoxCarouselState extends State<CustomBoxCarousel> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0, bottom: 0, left: kDefaultPadding),
      width: MediaQuery.of(context).size.width,
      height: 48,
      child: ListView.builder(
        itemCount: widget.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) =>
            buildBox(index: index, text: widget.items[index])),
      ),
    );
  }

  buildBox({required int index, required String text}) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (_, themeState) => CustomBox(
          borderRadiusAll: widget.cornerRadius ?? kDefaultRadius,
          borderColor: !isSelected
              ? themeState.isDarkMode
                  ? primaryColorLight
                  : textColorLight
              : Colors.transparent,
          fillColor: isSelected
              ? themeState.isDarkMode
                  ? accentColorLight
                  : textColorLight
              : Colors.transparent,
          child: getText(text, isSelected),
        ),
      ),
    );
  }

  getText(String text, bool isSelected) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Text(
        text,
        style: TextStyle(
          fontSize: fontSizeSmall,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected
              ? themeState.isDarkMode
                  ? primaryColorLight
                  : accentColorLight
              : themeState.isDarkMode
                  ? primaryColorLight
                  : textColorLight,
        ),
      ),
    );
  }
}
