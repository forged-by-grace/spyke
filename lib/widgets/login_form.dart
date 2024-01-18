import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/scenes/forgot_password.dart';
import 'package:spyke/scenes/sign_up.dart';
import 'package:spyke/utility/app_navigation.dart';
import 'package:spyke/widgets/custom_email.dart';
import 'package:spyke/widgets/custom_password.dart';
import 'package:spyke/widgets/custom_txt_btn.dart';

import '../utility/constants.dart';
import '../utility/email_validator.dart';
import 'custom_button.dart';
import 'login_sign_up_nav.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: kDefaultPadding),
            child: CustomEmail(
                label: 'Email',
                hint: 'Enter email',
                onchange: (value) {
                  setState(() {
                    email = value;
                  });
                }),
          ),
          CustomPassword(
            label: 'Password',
            hint: 'Enter password',
            validate: false,
            onchange: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: CustomTextButton(
              label: 'Forgot password?',
              onPressed: () =>
                  nextSceneWithAnim(nextScene: const ForgotPassword()),
            ),
          ),
          CustomButtonWidget(
            onPressed: () {},
            txt: 'Continue',
          ),
          const CustomLoginOrSignUpInquiry(
            leadingTxt: 'New to Spyke? ',
            actionTxt: 'Register now',
            nextScren: SignUpScene(),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
        ],
      ),
    );
  }
}
