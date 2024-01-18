import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spyke/scenes/direct_msg.dart';
import 'package:spyke/utility/app_navigation.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/custom_media_attachment.dart';

class PreviewPage extends StatefulWidget {
  final List<String> mediaUrl;
  final VoidCallback? onDone;
  final String title;
  final bool showButtomThumbnail;

  const PreviewPage(
      {Key? key,
      required this.mediaUrl,
      this.onDone,
      required this.title,
      required this.showButtomThumbnail})
      : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  int currentImageIndex = 0;

  //Used to toggle between full screen
  bool isFullScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: accentColorDark,
        appBar: AppBar(
          title: customTitle(title: widget.title),
          centerTitle: true,
          elevation: kDefaultElevation,
          backgroundColor: Colors.black,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light),
          actions: [
            (widget.onDone != null)
                ? IconButton(
                    onPressed: widget.onDone,
                    icon: const Icon(
                      Icons.done,
                      size: kDefaultIconSize,
                      color: accentColorLight,
                    ))
                : const SizedBox.shrink()
          ],
        ),
        body: Container(
          color: primaryColorDark,
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFullScreen = !isFullScreen;
                      });
                    },
                    child: ExtendedImage.asset(
                      widget.mediaUrl[currentImageIndex],
                      fit: BoxFit.contain,
                      //enableLoadState: false,
                      mode: ExtendedImageMode.gesture,
                      initGestureConfigHandler: (state) {
                        return GestureConfig(
                          minScale: 0.9,
                          animationMinScale: 0.7,
                          maxScale: 3.0,
                          animationMaxScale: 3.5,
                          speed: 1.0,
                          inertialSpeed: 100.0,
                          initialScale: 1.0,
                          inPageView: false,
                          initialAlignment: InitialAlignment.center,
                        );
                      },
                    )),
              ),
              (isFullScreen || widget.showButtomThumbnail)
                  ? const SizedBox.shrink()
                  : _buildThumbnail(
                      isFullScreen: isFullScreen,
                      showButtomThumbnail: widget.showButtomThumbnail)
            ],
          ),
        ));
  }

  _buildThumbnail(
      {required bool isFullScreen, required bool showButtomThumbnail}) {
    Widget thumbnail = Padding(
      padding: const EdgeInsets.all(
        kDefaultPadding * 0.2,
      ),
      child: CustomMediaAttachment(
        mediaUrl: mediaUrl,
        onIndexChanged: (value) {
          if (value != null) {
            setState(() {
              currentImageIndex = value!;
            });
          }
        },
      ),
    );

    if (showButtomThumbnail) {
      return isFullScreen ? thumbnail : const SizedBox.shrink();
    }

    return const SizedBox.shrink();
  }
}
