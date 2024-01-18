import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/scenes/chat_scene.dart';
import 'package:spyke/scenes/friends.dart';
import 'package:spyke/scenes/home.dart';
import 'package:spyke/scenes/onboarding.dart';
import 'package:spyke/scenes/sign_up.dart';
import 'package:spyke/utility/app_constants.dart';
import 'package:spyke/utility/app_navigation.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/annotated_region.dart';

class SplashScreen extends StatefulWidget {
  final String title;

  const SplashScreen({super.key, required this.title});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateToNext();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomRegion(
      isStatusIconLight: true,
      child: WidgetBody(title: widget.title),
    );
  }

  void _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    replaceScene(nextScene: const HomeScene());
  }
}

class WidgetBody extends StatelessWidget {
  const WidgetBody({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Stack(
        children: [
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Script MT',
                fontStyle: FontStyle.normal,
                fontSize: fontSizeLarge * 1.5,
                color: themeState.isDarkMode ? textColorDark : textColorLight,
              ),
            ),
          ),
          Positioned(
            bottom: kDefaultPadding * 0.5,
            left: kDefaultPadding * 0.5,
            right: kDefaultPadding * 0.5,
            child: Text(
              corporateName,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: lineHeight,
                fontStyle: FontStyle.normal,
                fontSize: fontSizeModerate,
                color: themeState.isDarkMode ? textColorDark : textColorLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
