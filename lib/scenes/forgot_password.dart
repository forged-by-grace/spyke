import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/scenes/otp_verification.dart';
import 'package:spyke/utility/app_navigation.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/utility/email_validator.dart';
import 'package:spyke/widgets/annotated_region.dart';
import 'package:spyke/widgets/custom_appbar.dart';
import 'package:spyke/widgets/custom_back_btn.dart';
import 'package:spyke/widgets/custom_button.dart';
import 'package:spyke/widgets/custom_desktop_body.dart';
import 'package:spyke/widgets/custom_email.dart';
import 'package:spyke/widgets/custom_forgot_txt.dart';
import 'package:spyke/widgets/desktop_widget.dart';
import 'package:spyke/widgets/illustration.dart';
import 'package:spyke/widgets/responsive.dart';

import '../widgets/custom_svg.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomRegion(
      verticalPadding: kDefaultPadding,
      horizontalPadding: kDefaultPadding,
      isStatusIconLight: true,
      child: Responsive(
        mobile: ForgotPasswordMobile(),
        desktop: ResponsiveDeskTop(
          back: true,
          appBar: CustomAppBar(
            showBackArrow: true,
          ),
          leading: CustomSvg(url: 'assets/images/forgot_password.svg'),
          middle: CustomDesktopBody(
              child: SingleChildScrollView(child: ForgotPasswordBody())),
        ),
        tablet: ResponsiveDeskTop(
          back: true,
          leading: CustomSvg(url: 'assets/images/forgot_password.svg'),
          middle: CustomDesktopBody(
              child: SingleChildScrollView(child: ForgotPasswordBody())),
        ),
      ),
    );
  }
}

class ForgotPasswordBody extends StatefulWidget {
  const ForgotPasswordBody({super.key});

  @override
  State<ForgotPasswordBody> createState() => _ForgotPasswordBodyState();
}

class _ForgotPasswordBodyState extends State<ForgotPasswordBody> {
  String email = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: const CustomForgotText(
            title: 'Forgot Password?',
            subtitle:
                'Don\'t worry it happens. Please enter the email address associated with your account.',
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: CustomEmail(
              label: 'Email',
              hint: 'Enter email',
              onchange: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
          ),
        ),
        CustomButtonWidget(
          onPressed: () =>
              nextSceneWithAnim(nextScene: OTPVerification(email: email)),
          txt: 'Continue',
        ),
      ],
    );
  }
}

class ForgotPasswordMobile extends StatelessWidget {
  const ForgotPasswordMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: kDefaultPadding * 0.5),
            child: CustomBackButton(onPressed: () => Get.back())),
        Expanded(
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CustomSvg(url: 'assets/images/forgot_password.svg'),
                  ForgotPasswordBody(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
