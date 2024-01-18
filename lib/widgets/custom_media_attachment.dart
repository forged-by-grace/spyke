import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/custom_box_img.dart';

class CustomMediaAttachment extends StatefulWidget {
  final List<String> mediaUrl;
  final ValueChanged onIndexChanged;

  const CustomMediaAttachment(
      {super.key, required this.mediaUrl, required this.onIndexChanged});

  @override
  State<CustomMediaAttachment> createState() => _CustomMediaAttachmentState();
}

class _CustomMediaAttachmentState extends State<CustomMediaAttachment> {
  final _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => ClipRRect(
        borderRadius:
            const BorderRadius.all(Radius.circular(kDefaultImageRadius * 0.5)),
        child: Container(
          height: 120,
          width: double.maxFinite,
          margin: const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
          child: AnimatedList(
              key: _listKey,
              scrollDirection: Axis.horizontal,
              initialItemCount: widget.mediaUrl.length,
              itemBuilder: ((context, index, animation) => GestureDetector(
                    onTap: () {
                      widget.onIndexChanged(index);
                    },
                    child: MediaItem(
                      mediaUrl: widget.mediaUrl[index],
                      animation: animation,
                      onRemoved: () => removeItem(index),
                    ),
                  ))),
        ),
      ),
    );
  }

  removeItem(int index) {
    final removedItem = mediaUrl[index];

    //Remove from list
    mediaUrl.removeAt(index);

    //Remove from animated list
    _listKey.currentState!.removeItem(
        index,
        (context, animation) => MediaItem(
            mediaUrl: removedItem, animation: animation, onRemoved: () {}));
  }
}

class MediaItem extends StatelessWidget {
  const MediaItem({
    Key? key,
    required this.mediaUrl,
    required this.animation,
    required this.onRemoved,
  }) : super(key: key);

  final String mediaUrl;
  final Animation<double> animation;
  final VoidCallback onRemoved;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
          height: 120,
          width: 120,
          margin: const EdgeInsets.fromLTRB(kDefaultPadding * 0.5, 0, 0, 0),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(kDefaultRadius))),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CustomBoxImage(
                  url: mediaUrl,
                  height: 120,
                  width: 120,
                  cornerRadius: kDefaultRadius),
              Positioned(
                  right: 2,
                  top: 2,
                  child: GestureDetector(
                    onTap: onRemoved,
                    child: const Icon(
                      Icons.cancel,
                      color: accentColorLight,
                      size: kDefaultIconSize,
                    ),
                  ))
            ],
          )),
    );
  }
}
