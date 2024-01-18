import 'package:flutter/material.dart';

import '../utility/constants.dart';
import 'auth_header_widget.dart';
import 'custom_auth_provider.dart';
import 'login_form.dart';

class CustomLoginWidget extends StatelessWidget {
  const CustomLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAuthHeaderWidget(
            title: 'Login',
            middle: CustomAuthProviderWidget(
              onPressedGoogle: (){}, 
              onPressedFacebook: (){}, 
              onPressedTwitter: (){},
              ),
            altHeader: 'or login with email',
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          const LoginForm(),
      ],
    );
  }
}