import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ionicons/ionicons.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/scenes/custom_txt_area.dart';
import 'package:spyke/utility/app_navigation.dart';
import 'package:spyke/utility/email_validator.dart';
import 'package:spyke/utility/password_validator.dart';
import 'package:spyke/widgets/custom_button.dart';
import 'package:spyke/widgets/custom_divider.dart';
import 'package:spyke/widgets/custom_email.dart';
import 'package:spyke/widgets/custom_password.dart';
import 'package:spyke/widgets/custom_txt_btn.dart';
import 'package:spyke/widgets/custom_txt_field.dart';

import '../scenes/login.dart';
import '../utility/constants.dart';
import 'login_sign_up_nav.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = '';
  String mobile = '';
  String name = '';
  String password = '';
  String confirmPassword = '';
  String country = '';
  String countryCode = '';

  bool confirmPasswordVisible = false;
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
              child: CustomEmail(
                label: 'Email',
                hint: 'Enter your email',
                onchange: (value) {
                  setState(() {
                    email = value;
                  });
                },
              )),
          Container(
            margin: const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
            child: CustomTextField(
              label: 'Full name',
              hint: 'Enter full name',
              onChange: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
            child: IntlPhoneField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Mobile',
                hintText: '816 6145 417',
                prefixIcon: Icon(Ionicons.mail_outline),
              ),
              onChanged: (phone) {
                setState(() {
                  mobile = phone.completeNumber;
                });
              },
              onCountryChanged: (country) {
                setState(() {
                  countryCode = country.code;
                  this.country = country.name;
                });
              },
              validator: ((value) {
                if (value?.completeNumber != null &&
                    value?.completeNumber == '') {
                  return 'Mobile number is required';
                }
                return null;
              }),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
            child: CustomPassword(
              label: 'Password',
              hint: 'Enter password',
              onchange: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
            child: CustomPassword(
              label: 'Confirm password',
              hint: 'Confirm your password',
              prevPassword: password,
              onchange: (value) {
                setState(() {
                  confirmPassword = value;
                });
              },
            ),
          ),
          CustomButtonWidget(
            onPressed: () {},
            txt: 'Continue',
          ),
          const CustomLoginOrSignUpInquiry(
            leadingTxt: 'Joined us before? ',
            actionTxt: 'Login',
            nextScren: LoginScene(),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (_, themeState) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextButton(
                  label: 'Terms of Service',
                  onPressed: () => nextSceneWithAnim(
                    nextScene: const CustomTextArea(
                        title: 'Terms of Service',
                        body:
                            'khjkhkjhkjhkjhjkh  jkhjkh lhkjh jkhjk hlkhljk hkjhjk'),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: CustomDivider(
                        width: 1,
                        height: 24,
                        color: themeState.isDarkMode
                            ? primaryColorLight
                            : primaryColorDark)),
                CustomTextButton(
                  label: 'Privacy Policy',
                  onPressed: () => nextSceneWithAnim(
                    nextScene: const CustomTextArea(
                        title: 'Privacy Policy',
                        body:
                            'khjkhkjhkjhkjhjkh  jkhjkh lhkjh jkhjk hlkhljk hkjhjk'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
