import 'package:flutter/material.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/custom_auth_provider.dart';
import 'package:spyke/widgets/sign_up_form.dart';
import 'auth_header_widget.dart';

class CustomSignUpFormWidget extends StatelessWidget {
  const CustomSignUpFormWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAuthHeaderWidget(
            title: 'Sign Up',
            middle: CustomAuthProviderWidget(
              onPressedGoogle: (){}, 
              onPressedFacebook: (){}, 
              onPressedTwitter: (){},
              ),
            altHeader: 'or register with email',
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          const SignUpForm(),
        ],
    );
  }
}