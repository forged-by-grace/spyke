import 'package:flutter/material.dart';
import 'package:spyke/dialog/profile_dialog.dart';

class DialogHelper {
  static showProfile(
          {required BuildContext context,
          required String imgUrl,
          required String title}) =>
      showDialog(
          context: context,
          builder: (context) => ProfileDialog(imgUrl: imgUrl, title: title));
}
