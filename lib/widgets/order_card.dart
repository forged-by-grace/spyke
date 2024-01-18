import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/custom_box_img.dart';

import '../model/order.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Container(
        height: 120,
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.5),
        child: Row(
          children: [
            CustomBoxImage(
                url: order.thumbnail,
                height: 120,
                width: 120,
                cornerRadius: kDefaultRadius),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                      themeState: themeState, text: order.title, isBold: true),
                  const SizedBox(
                    height: kDefaultPadding * 0.3,
                  ),
                  customText(
                      themeState: themeState,
                      text: formatCurrency(order.amount),
                      textColor: Colors.red,
                      isBold: true),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.cancel,
                    size: 24,
                    color: themeState.isDarkMode
                        ? accentColorLight
                        : textColorLight,
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding * 0.3,
                ),
                customText(
                    themeState: themeState,
                    text: buildQuantity(order.quantity),
                    isBold: false,
                    textColor: primaryColorLight)
              ],
            )
          ],
        ),
      ),
    );
  }

  Text customText(
      {required AppState themeState,
      required String text,
      required bool isBold,
      Color? textColor}) {
    return Text(
      text,
      style: TextStyle(
        color: (textColor != null)
            ? textColor
            : themeState.isDarkMode
                ? accentColorLight
                : textColorLight,
        fontSize: fontSizeSmall,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
      ),
    );
  }

  buildQuantity(double quantity) {
    if (quantity.toInt() > 1) {
      return '${quantity.toInt()} pcs';
    } else {
      return '${quantity.toInt()} pc';
    }
  }
}
