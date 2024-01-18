import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:spyke/redux/appstate.dart';

import '../widgets/custom_box_img.dart';
import '../widgets/custom_msg_reply.dart';

const kDefaultPadding = 20.0;

const kBackgroundLight = LinearGradient(
  colors: [primaryColorLight, accentColorLight],
  stops: [0.0, 0.5],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  tileMode: TileMode.mirror,
);
const kScaffordBgLight = LinearGradient(
  colors: [Colors.white, accentColorLight],
  stops: [0.3, 1.0],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  tileMode: TileMode.mirror,
);

const kMediaPickerBgLight = LinearGradient(
  colors: [Color(0xff708090), Color(0xff384048)],
  stops: [0.5, 1.0],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  tileMode: TileMode.mirror,
);

const kDefaultBorderThickness = 1.0;

const kBackgroundDark = LinearGradient(
  colors: [accentColorDark, primaryColorDark],
  stops: [0.0, .5],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  tileMode: TileMode.mirror,
);
const defaultPageAnimDuration = Duration(milliseconds: 1500);

const primaryColorLight = Color(0xff8b0000);
const primaryColorDark = Color.fromARGB(255, 22, 22, 22);

const textColorLight = Color(0xff707070);

const textColorDark = Color(0xff8b0000);
const accentGreyBg = Color(0x4D707070);
const deepGray = Color(0xff696969);
const tabUnselectedColor = Color(0xffBBB9B9);
const accentColorLight = Color(0xfffff0f5);
const accentColorDark = Color.fromARGB(255, 34, 34, 34);

const bottomNavBarColorLight = Colors.white;
const kDefaultIndicatorRadius = kDefaultPadding * 0.2;
const kDefaultRadius = 12.0;
const kDefaultElevation = 5.0;

//DM constants
const kDMmessageRadius = 18.0;
const msgRecipientBgColor = Color(0xffffe4e1);
const dmSenderBgColor = Color(0xfff08080);
const transBlack = Color.fromARGB(100, 0, 0, 0);

//Grid constants
const kChildAspectRatio = 0.7;
const kCrossExtent = 100.0;

enum MessageStatus { pending, sent, seen }

const appName = 'Spyke';

const fontSizeSmall = 14.0;
const fontSizeModerate = 16.0;
const fontSizeLarge = 24.0;

const lightFontColor = Colors.black87;
const darkFontColor = accentColorLight;

const accentFontColorLight = Colors.black45;

const defaultHeight = 48.0;
const defaultIconSize = 24.0;

const lineHeight = 1.2;

const corporateName = 'from\nConano';

const statusBarStyleDark = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
);

const statusBarStyleLight = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.light,
);

const kDefaultPasswordLength = 6;

const kDefaultImageRadius = 24.0;
const kDefaultIconSize = 24.0;

const kDefaultListExtent = 60.0;
const kCircularIconListExtent = 65.0;

customTitle({
  required String title,
  Color? titleColor,
}) {
  return StoreConnector<AppState, AppState>(
    converter: (store) => store.state,
    builder: (_, themeState) => Text(
      title,
      style: TextStyle(
        color: (titleColor != null)
            ? titleColor
            : themeState.isDarkMode
                ? primaryColorLight
                : accentColorLight,
        fontFamily: 'Script MT',
        fontStyle: FontStyle.normal,
        fontSize: fontSizeLarge,
      ),
    ),
  );
}

formatCurrency(double amount) {
  final formatCurrency = NumberFormat.simpleCurrency();

  return formatCurrency.format(amount);
}

const kDefaultTrimLines = 5;

buildAttachment(
    {required BuildContext context,
    Map<String, dynamic>? reply,
    List<Map<String, dynamic>>? attachments}) {
  if (attachments != null || reply != null) {
    return (reply != null)
        ? CustomMessageReply(
            backgroundColor: Colors.black26,
            title: reply['previousMessage'],
            sender: reply['sender'],
            attachment:
                (reply['attachment'] != null) ? reply['attachment'] : null)
        : Stack(children: [
            CustomBoxImage(
                url: attachments![0]['thumbnail'],
                height: 180,
                width: double.maxFinite,
                backgroundColor: Colors.black26,
                cornerRadius: kDefaultImageRadius),
            Positioned(
                top: 5,
                right: 5,
                child: Container(
                  padding: const EdgeInsets.all(kDefaultPadding * 0.2),
                  child: Row(
                    children: [
                      Text(
                        attachments.length.toString(),
                        style: const TextStyle(
                            color: accentColorLight, fontSize: fontSizeSmall),
                      ),
                      const SizedBox(
                        width: kDefaultPadding * 0.2,
                      ),
                      const Icon(
                        Icons.photo_camera,
                        size: 24,
                        color: accentColorLight,
                      )
                    ],
                  ),
                ))
          ]);
  } else {
    return const SizedBox.shrink();
  }
}

const chatBoxMaxLines = 5;

const mediaUrl = [
  'assets/images/products/b1.png',
  'assets/images/products/b2.png',
  'assets/images/products/b3.png',
  'assets/images/products/b4.png',
  'assets/images/products/sh1.png',
  'assets/images/products/sh2.png',
  'assets/images/products/sh3.png',
];

const dialogHeight = 350.0;
const kOpacity = 0.7;
const kDefaultProfileColor = Color(0xffc6c4c4);
const kDividerThickness = 1.0;
