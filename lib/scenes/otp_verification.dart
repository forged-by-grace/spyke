import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/scenes/reset_password.dart';
import 'package:spyke/utility/app_navigation.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/annotated_region.dart';
import 'package:spyke/widgets/custom_appbar.dart';
import 'package:spyke/widgets/custom_back_btn.dart';
import 'package:spyke/widgets/custom_button.dart';
import 'package:spyke/widgets/custom_desktop_body.dart';
import 'package:spyke/widgets/custom_forgot_txt.dart';
import 'package:spyke/widgets/custom_otp_txt.dart';
import 'package:spyke/widgets/custom_svg.dart';
import 'package:spyke/widgets/desktop_widget.dart';
import 'package:spyke/widgets/responsive.dart';

class OTPVerification extends StatelessWidget {
  final String email;

  const OTPVerification({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return CustomRegion(
        verticalPadding: kDefaultPadding,
        horizontalPadding: kDefaultPadding,
        isStatusIconLight: true,
        child: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (_, themeState) => Responsive(
            desktop: ResponsiveDeskTop(
              appBar: const CustomAppBar(showBackArrow: true),
              leading: const CustomSvg(url: 'assets/images/otp.svg'),
              middle: CustomDesktopBody(
                child: SingleChildScrollView(
                    child: CustomOTPBody(themeState: themeState, email: email)),
              ),
              back: true,
            ),
            tablet: ResponsiveDeskTop(
              appBar: const CustomAppBar(
                showBackArrow: true,
              ),
              leading: const CustomSvg(url: 'assets/images/otp.svg'),
              middle: CustomDesktopBody(
                child: SingleChildScrollView(
                    child: CustomOTPBody(themeState: themeState, email: email)),
              ),
              back: true,
            ),
            mobile: OTPMobile(themeState: themeState, email: email),
          ),
        ));
  }
}

class OTPMobile extends StatelessWidget {
  final AppState themeState;
  final String email;

  const OTPMobile({
    super.key,
    required this.themeState,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomBackButton(onPressed: () => Get.back()),
        Expanded(
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSvg(url: 'assets/images/otp.svg'),
                  CustomOTPBody(themeState: themeState, email: email),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CustomOTPBody extends StatefulWidget {
  final AppState themeState;
  final String email;

  const CustomOTPBody(
      {super.key, required this.themeState, required this.email});

  @override
  State<CustomOTPBody> createState() => _CustomOTPBodyState();
}

class _CustomOTPBodyState extends State<CustomOTPBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String firstDigit = '';
  String secondDigit = '';
  String thirdDigit = '';
  String forthDigit = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomForgotText(
            title: 'Enter OTP',
            subtitle: 'A 4 digit code was sent to \n${widget.email}'),
        Container(
          margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: CustomOTPWidget(
              height: MediaQuery.of(context).size.shortestSide * 0.1,
              width: MediaQuery.of(context).size.shortestSide * 0.1,
              firstDigit: (value) {
                setState(() {
                  firstDigit = value;
                });
                FocusScope.of(context).nextFocus();
              },
              secondDigit: (value) {
                setState(() {
                  secondDigit = value;
                });
                FocusScope.of(context).nextFocus();
              },
              thirdDigit: (value) {
                setState(() {
                  thirdDigit = value;
                });
                FocusScope.of(context).nextFocus();
              },
              forthDigit: (value) {
                setState(() {
                  forthDigit = value;
                });
                FocusScope.of(context).nextFocus();
              },
              formKey: _formKey,
            ),
          ),
        ),
        CustomButtonWidget(
          onPressed: () => nextSceneWithAnim(nextScene: const ResetPassword()),
          txt: 'Continue',
        ),
      ],
    );
  }
}
