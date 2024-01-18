import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:spyke/widgets/custom_appbar.dart';
import 'package:spyke/widgets/custom_back_btn.dart';
import 'package:spyke/widgets/responsive.dart';

import '../redux/appstate.dart';
import '../utility/constants.dart';

class ResponsiveDeskTop extends StatelessWidget {
  final Widget? appBar;
  final Widget leading;
  final Widget middle;
  final Widget? trailing;
  final bool? back;

  const ResponsiveDeskTop(
      {super.key,
      required this.leading,
      required this.middle,
      this.trailing,
      this.appBar,
      this.back});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (appBar != null) ? appBar! : const SizedBox.shrink(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: kDefaultPadding),
                      child: leading,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: Responsive.isTablet(context)
                        ? MediaQuery.of(context).size.width * 0.45
                        : MediaQuery.of(context).size.width * 0.4,
                    padding: const EdgeInsets.all(kDefaultPadding * 0.5),
                    child: SingleChildScrollView(
                      child: middle,
                    ),
                  ),
                ),
                (trailing != null)
                    ? Expanded(child: trailing!)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
