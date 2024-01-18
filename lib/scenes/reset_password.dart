import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:spyke/scenes/login.dart';
import 'package:spyke/utility/app_navigation.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/utility/password_validator.dart';
import 'package:spyke/widgets/annotated_region.dart';
import 'package:spyke/widgets/custom_appbar.dart';
import 'package:spyke/widgets/custom_back_btn.dart';
import 'package:spyke/widgets/custom_button.dart';
import 'package:spyke/widgets/custom_desktop_body.dart';
import 'package:spyke/widgets/custom_forgot_txt.dart';
import 'package:spyke/widgets/custom_password.dart';
import 'package:spyke/widgets/custom_svg.dart';
import 'package:spyke/widgets/desktop_widget.dart';
import 'package:spyke/widgets/responsive.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomRegion(
      verticalPadding: kDefaultPadding,
      horizontalPadding: kDefaultPadding,
      isStatusIconLight: true,
      child: Responsive(
        desktop: ResponsiveDeskTop(
          appBar: CustomAppBar(
            showBackArrow: true,
          ),
          leading: CustomSvg(url: 'assets/images/reset_password.svg'),
          middle: CustomDesktopBody(
              child: SingleChildScrollView(child: CustomResetBody())),
        ),
        mobile: ResetPasswordMobile(),
        tablet: ResponsiveDeskTop(
          appBar: CustomAppBar(
            showBackArrow: true,
          ),
          leading: CustomSvg(url: 'assets/images/reset_password.svg'),
          middle: CustomDesktopBody(
              child: SingleChildScrollView(child: CustomResetBody())),
        ),
      ),
    );
  }
}

class CustomResetBody extends StatefulWidget {
  const CustomResetBody({super.key});

  @override
  State<CustomResetBody> createState() => _CustomResetBodyState();
}

class _CustomResetBodyState extends State<CustomResetBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String newPassword = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child:
                const CustomForgotText(title: 'Reset Password', subtitle: '')),
        Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPassword(
                label: 'New password',
                hint: 'Enter new password',
                onchange: (value) {
                  setState(() {
                    newPassword = value;
                  });
                },
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              CustomPassword(
                label: 'Confirm password',
                hint: 'Confirm your password',
                prevPassword: newPassword,
                onchange: ((value) {
                  setState(() {
                    confirmPassword = value;
                  });
                }),
              ),
            ],
          ),
        ),
        CustomButtonWidget(
            onPressed: () => nextSceneWithAnim(nextScene: const LoginScene()),
            txt: 'Continue'),
      ],
    );
  }
}

class ResetPasswordMobile extends StatelessWidget {
  const ResetPasswordMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomBackButton(onPressed: () => Get.back()),
        Expanded(
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CustomSvg(url: 'assets/images/forgot_password.svg'),
                  CustomResetBody(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
