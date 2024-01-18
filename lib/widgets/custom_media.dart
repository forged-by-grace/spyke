import 'package:flutter/material.dart';
import 'package:spyke/enum/media_type.dart';

import '../utility/constants.dart';

class CustomMedia extends StatelessWidget {
  final List media;
  final VoidCallback? onFloatingButtonPressed;
  final String mediaType;
  final String? floatingText;
  final Icon? floatingIcon;

  const CustomMedia({
    Key? key,
    required this.media,
    this.onFloatingButtonPressed,
    required this.mediaType,
    this.floatingText,
    this.floatingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(kDefaultRadius)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.height * 0.2,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(kDefaultRadius))),
        child: Stack(fit: StackFit.expand, children: [
          GridView.builder(
            itemCount: media.length,
            itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(kDefaultPadding * 0.1),
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.height * 0.05,
                child: _buildMediaContent(
                    mediaType: mediaType, media: media[index])),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: kCrossExtent,
              childAspectRatio: kChildAspectRatio,
              mainAxisSpacing: kDefaultPadding * 0.5,
            ),
          ),
          Center(
              child: GestureDetector(
            onTap: () => onFloatingButtonPressed,
            child: (floatingIcon != null || floatingText != null) ? Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(48)),
                  color: transBlack),
              child: Row(
                children: [
                  floatingIcon ?? const SizedBox.square(),
                  const SizedBox(
                    width: kDefaultPadding * 0.2,
                  ),
                  floatingText != null ? Text(
                    _isPlural(length: media.length, floatingText: floatingText!),
                    style: const TextStyle(
                      fontSize: fontSizeModerate,
                      color: primaryColorLight,
                    ),
                  ) 
                  : const SizedBox.shrink(),
                ],
              ),
            ) : const SizedBox.shrink(),
          )),
        ]),
      ),
    );
  }

  String _isPlural({required int length, required String floatingText}) {
    return length > 1 ? '$length $floatingText' 's' : '$length $floatingText';
  }

  _buildMediaContent({required media, required String mediaType}) {
    if (mediaType == MediaType.image.name) {
      return Image.network(media.url);
    } else if (mediaType == MediaType.video.name) {
      return Image.network(media.thumbnail);
    }
  }
}
