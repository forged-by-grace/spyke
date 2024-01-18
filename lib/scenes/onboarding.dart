import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:spyke/model/slide.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/scenes/sign_up.dart';
import 'package:spyke/utility/app_navigation.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/annotated_region.dart';
import 'package:spyke/widgets/custom_button.dart';
import 'package:spyke/widgets/slide_item.dart';

import '../widgets/login_sign_up_nav.dart';
import '../widgets/responsive.dart';
import 'login.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;

  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < (slideList.length - 1)) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.positions.isNotEmpty) {
        _pageController.animateToPage(_currentPage,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      }
    });

    super.initState();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomRegion(
      isStatusIconLight: true,
      child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (_, themeState) => Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient:
                  themeState.isDarkMode ? kBackgroundDark : kBackgroundLight,
            ),
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: slideList.length,
                      effect: WormEffect(
                          activeDotColor: primaryColorLight,
                          dotColor: Colors.blueGrey.shade100,
                          dotHeight: 16,
                          dotWidth: 16,
                          type: WormType.normal),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Expanded(
                      child: PageView.builder(
                          onPageChanged: _onPageChanged,
                          controller: _pageController,
                          itemCount: slideList.length,
                          itemBuilder: (context, index) =>
                              SlideItem(index: index)),
                    ),
                    (Responsive.isMobile(context))
                        ? Column(
                            children: [
                              CustomButtonWidget(
                                onPressed: () => replaceSceneWithAnim(
                                    nextScene: const SignUpScene()),
                                txt: 'Getting Started',
                              ),
                              const CustomLoginOrSignUpInquiry(
                                leadingTxt: 'Joined us before? ',
                                actionTxt: 'Login',
                                nextScren: LoginScene(),
                              ),
                            ],
                          )
                        : SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Column(
                              children: [
                                CustomButtonWidget(
                                  onPressed: () => replaceSceneWithAnim(
                                      nextScene: const SignUpScene()),
                                  txt: 'Getting Started',
                                ),
                                const CustomLoginOrSignUpInquiry(
                                  leadingTxt: 'Joined us before? ',
                                  actionTxt: 'Login',
                                  nextScren: LoginScene(),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
