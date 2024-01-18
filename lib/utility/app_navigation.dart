import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'constants.dart';

replaceScene({required Widget nextScene}) {
  Get.off((nextScene),
      transition: Transition.zoom, duration: defaultPageAnimDuration);
}

replaceSceneWithAnim({required Widget nextScene}) {
  Get.off((nextScene),
      transition: Transition.downToUp, duration: defaultPageAnimDuration);
}

nextScene({required Widget nextScene}) {
  Get.to((nextScene),
      transition: Transition.fade, duration: defaultPageAnimDuration);
}

nextSceneWithAnim({required Widget nextScene}) {
  Get.to((nextScene),
      transition: Transition.fadeIn, duration: defaultPageAnimDuration);
}

previousScene() {
  Get.back();
}
