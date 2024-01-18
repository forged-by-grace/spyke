import 'package:flutter/material.dart';
import 'package:spyke/utility/constants.dart';

import '../model/video.dart';

class CustomVideoMedia extends StatelessWidget {
  final List<Video> video;
  final VoidCallback? onPlayPressed;
  const CustomVideoMedia({Key? key, required this.video, this.onPlayPressed})
      : super(key: key);

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
            itemCount: video.length,
            itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(kDefaultPadding * 0.1),
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.height * 0.05,
                child: Image.network(
                  video[index].thumbnail,
                  fit: BoxFit.contain,
                )),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: kCrossExtent,
              childAspectRatio: kChildAspectRatio,
              mainAxisSpacing: kDefaultPadding * 0.5,
            ),
          ),
          Center(
              child: GestureDetector(
            onTap: () => onPlayPressed,
            child: Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(48)),
                color: transBlack
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.play_circle,
                    size: kDefaultIconSize,
                    color: primaryColorLight,
                  ),
                  const SizedBox(width: kDefaultPadding * 0.2,),
                  Text(
                    getVideoText(video.length),
                    style: const TextStyle(
                      fontSize: fontSizeModerate,
                      color: primaryColorLight,
                    ),
                    ),
                     
                ],
              ),
            ),
          )),
        ]),
      ),
    );
  }

  getVideoText(int length) {
    return length > 1 ? '$length videos' : '$length video';
  }
}
