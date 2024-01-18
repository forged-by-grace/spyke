import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/annotated_region.dart';
import 'package:spyke/widgets/custom_appbar.dart';
import 'package:spyke/widgets/custom_desktop_body.dart';
import 'package:spyke/widgets/custom_svg.dart';
import 'package:spyke/widgets/desktop_widget.dart';
import 'package:spyke/widgets/responsive.dart';
import 'package:spyke/widgets/custom_sign_up.dart';

class SignUpScene extends StatefulWidget {
  const SignUpScene({super.key});

  @override
  State<SignUpScene> createState() => _SignUpSceneState();
}

class _SignUpSceneState extends State<SignUpScene> {
  @override
  Widget build(BuildContext context) {
    return const CustomRegion(
      verticalPadding: kDefaultPadding,
      horizontalPadding: kDefaultPadding,
      isStatusIconLight: true,
      child: SafeArea(
        child: Responsive(
          mobile: SignUpMobile(),
          desktop: ResponsiveDeskTop(
            appBar: CustomAppBar(
              title: appName,
            ),
            leading: CustomSvg(url: 'assets/images/new_sign_up.svg'),
            middle: CustomDesktopBody(
                child: SingleChildScrollView(
              child: CustomSignUpFormWidget(),
            )),
          ),
          tablet: ResponsiveDeskTop(
            appBar: CustomAppBar(
              title: appName,
            ),
            leading: CustomSvg(url: 'assets/images/new_sign_up.svg'),
            middle: CustomDesktopBody(
              child: SingleChildScrollView(
                child: CustomSignUpFormWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpMobile extends StatelessWidget {
  const SignUpMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: const [
            CustomSvg(url: 'assets/images/new_sign_up.svg'),
            SizedBox(
              height: kDefaultPadding,
            ),
            CustomSignUpFormWidget(),
          ],
        ),
      ),
    );
  }
}
