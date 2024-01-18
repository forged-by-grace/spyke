import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/custom_image_button.dart';

class CustomImageThumbnail extends StatelessWidget {
  final String title;
  final String imgUrl;
  final VoidCallback? onPressed;
  final Color? textColor;

  const CustomImageThumbnail(
      {super.key,
      required this.title,
      required this.imgUrl,
      this.onPressed,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomCircularImageButton(url: imgUrl),
          const SizedBox(
            height: kDefaultPadding * 0.2,
          ),
          StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (_, themeState) => Text(
              title.split(', ')[0],
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: textColor ?? accentColorLight,
                fontSize: fontSizeModerate,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
