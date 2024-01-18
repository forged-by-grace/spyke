import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/annotated_region.dart';
import 'package:spyke/widgets/custom_button.dart';
import 'package:spyke/widgets/responsive.dart';

import '../redux/appstate.dart';

class CustomTextArea extends StatelessWidget {
  final String title;
  final String body;

  const CustomTextArea({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return CustomRegion(
      isStatusIconLight: true,
      child: CustomBody(
        body: body,
        title: title,
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({
    Key? key,
    required this.body,
    required this.title,
  }) : super(key: key);

  final String body;
  final String title;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Container(
        margin: (Responsive.isDesktop(context) || Responsive.isTablet(context))
            ? EdgeInsets.symmetric(
                vertical: kDefaultPadding,
                horizontal: MediaQuery.of(context).size.width * 0.2)
            : const EdgeInsets.only(bottom: kDefaultPadding),
        padding: const EdgeInsets.all(
          kDefaultPadding,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.all(Radius.circular(kDefaultRadius)),
            color: themeState.isDarkMode ? Colors.black26 : accentColorLight),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: fontSizeLarge,
                fontWeight: FontWeight.bold,
                color: primaryColorLight,
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  body,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color:
                        themeState.isDarkMode ? darkFontColor : lightFontColor,
                    fontSize: fontSizeSmall,
                  ),
                ),
              ),
            ),
            CustomButtonWidget(onPressed: () => Get.back(), txt: 'Got it')
          ],
        ),
      ),
    );
  }
}
