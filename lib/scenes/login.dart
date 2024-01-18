import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/widgets/annotated_region.dart';
import 'package:spyke/widgets/custom_desktop_body.dart';
import 'package:spyke/widgets/custom_svg.dart';
import 'package:spyke/widgets/desktop_widget.dart';
import 'package:spyke/widgets/responsive.dart';

import '../redux/appstate.dart';
import '../utility/constants.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_login_widget.dart';

class LoginScene extends StatefulWidget {
  const LoginScene({super.key});

  @override
  State<LoginScene> createState() => _LoginSceneState();
}

class _LoginSceneState extends State<LoginScene> {
  @override
  Widget build(BuildContext context) {
    return const CustomRegion(
        verticalPadding: kDefaultPadding,
        horizontalPadding: kDefaultPadding,
        isStatusIconLight: true,
        child: SafeArea(
          child: Responsive(
            desktop: ResponsiveDeskTop(
              appBar: CustomAppBar(
                title: appName,
              ),
              leading: CustomSvg(url: 'assets/images/login.svg'),
              middle: CustomDesktopBody(
                  child: SingleChildScrollView(child: CustomLoginWidget())),
            ),
            mobile: LoginMobile(),
            tablet: ResponsiveDeskTop(
              appBar: CustomAppBar(title: appName),
              leading: CustomSvg(url: 'assets/images/login.svg'),
              middle: CustomDesktopBody(
                  child: SingleChildScrollView(child: CustomLoginWidget())),
            ),
          ),
        ),
      );
  }
}

class LoginMobile extends StatelessWidget {
  const LoginMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(kDefaultPadding),
      child: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: const [
              CustomSvg(url: 'assets/images/login.svg'),
              SizedBox(
                height: kDefaultPadding,
              ),
              CustomLoginWidget()
            ],
          ),
        ),
      ),
    );
  }
}
