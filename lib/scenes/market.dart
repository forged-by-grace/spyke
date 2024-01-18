import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/scenes/market_category.dart';
import 'package:spyke/scenes/market_home.dart';
import 'package:spyke/scenes/market_product.dart';
import 'package:spyke/scenes/market_store.dart';
import 'package:spyke/widgets/custom_scafford_bg.dart';

import '../utility/constants.dart';

class MarketScene extends StatelessWidget {
  const MarketScene({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: statusBarStyleLight,
            elevation: 0,
            title: customTitle(title: 'Market'),
            centerTitle: false,
            backgroundColor:
                themeState.isDarkMode ? primaryColorDark : primaryColorLight,
            bottom: TabBar(
                isScrollable: true,
                indicatorColor: themeState.isDarkMode
                    ? primaryColorLight
                    : accentColorLight,
                unselectedLabelColor: themeState.isDarkMode
                    ? primaryColorLight
                    : tabUnselectedColor,
                unselectedLabelStyle: const TextStyle(
                  fontSize: fontSizeSmall,
                ),
                labelStyle: TextStyle(
                    color: themeState.isDarkMode
                        ? primaryColorLight
                        : accentColorLight,
                    fontSize: fontSizeSmall,
                    fontWeight: FontWeight.bold),
                tabs: const[
                  Tab(
                    text: 'Home',
                    icon: Icon(
                      Icons.home,
                      size: 24,
                    ),
                  ),
                  Tab(
                    text: 'Categories',
                    icon: Icon(
                      FontAwesomeIcons.listUl,
                      size: 24,
                    ),
                  ),
                  Tab(
                    text: 'Stores',
                    icon: Icon(
                      FontAwesomeIcons.store,
                      size: 24,
                    ),
                  ),
                  Tab(
                    text: 'Products',
                    icon: Icon(
                      Icons.local_mall,
                      size: 24,
                    ),
                  ),
                ]),
          ),
          body: const CustomScaffordBackground(
              child: TabBarView(children: [
            MarketHome(),
            MarketCategory(),
            MarketStore(),
            MarketProduct()
          ])),
        ),
      ),
    );
  }
}
