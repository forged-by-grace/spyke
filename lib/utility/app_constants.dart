import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppConstants {
  static nextScreen({required Widget widget}) {
    Get.to(widget);
  }
}
