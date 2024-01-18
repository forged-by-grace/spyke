import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:spyke/widgets/responsive.dart';

import '../utility/constants.dart';
import 'outlined_box_icon.dart';

class CustomAuthProviderWidget extends StatelessWidget {
  final VoidCallback onPressedGoogle;
  final VoidCallback onPressedFacebook;
  final VoidCallback onPressedTwitter;

  const CustomAuthProviderWidget(
      {super.key,
      required this.onPressedGoogle,
      required this.onPressedFacebook,
      required this.onPressedTwitter});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedBoxIcon(
          icon: Ionicons.logo_google,
          height: 48,
          width: responsiveWidth(context),
          iconColor: primaryColorLight,
          iconSize: 24,
          onPressed: onPressedGoogle,
        ),
        OutlinedBoxIcon(
          icon: Ionicons.logo_facebook,
          height: 48,
          width: responsiveWidth(context),
          iconColor: primaryColorLight,
          iconSize: 24,
          onPressed: onPressedFacebook,
        ),
        OutlinedBoxIcon(
          icon: Ionicons.logo_twitter,
          height: 48,
          width: responsiveWidth(context),
          iconColor: primaryColorLight,
          iconSize: 24,
          onPressed: onPressedTwitter,
        ),
      ],
    );
  }

  double responsiveWidth(BuildContext context) {
    if (Responsive.isTablet(context)) {
      return MediaQuery.of(context).size.width * 0.12;
    } else if (Responsive.isDesktop(context)) {
      return MediaQuery.of(context).size.width * 0.1;
    } else {
      return MediaQuery.of(context).size.width * 0.25;
    }
  }
}
