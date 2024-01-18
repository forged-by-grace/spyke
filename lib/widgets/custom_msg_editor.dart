import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:metro_icons/metro_icons.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/scenes/preview/preview_page.dart';
import 'package:spyke/utility/app_navigation.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/custom_circular_icon_btn.dart';
import 'package:spyke/widgets/custom_media_attachment.dart';
import 'package:spyke/widgets/custom_pick_file.dart';
import 'package:flutter/foundation.dart' as foundation;

class CustomMessageEditor extends StatefulWidget {
  const CustomMessageEditor({
    super.key,
  });

  @override
  State<CustomMessageEditor> createState() => _CustomMessageEditorState();
}

class _CustomMessageEditorState extends State<CustomMessageEditor> {
  bool showMedia = false;
  bool showPicker = false;
  bool showEmojiPicker = false;

  FocusNode textFieldFocus = FocusNode();
  final TextEditingController _controller = TextEditingController();

  showKeyboard() => textFieldFocus.requestFocus();
  hideKeyboard() => textFieldFocus.unfocus();

  showMEmojiPicker() {
    setState(() {
      showEmojiPicker = true;
    });
  }

  hideMEmojiPicker() {
    setState(() {
      showEmojiPicker = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(kDefaultPadding * 0.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (_, themeState) => Expanded(
              child: ClipRRect(
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(kDMmessageRadius)),
                  ),
                  elevation: kDefaultElevation,
                  child: Container(
                    alignment: Alignment.center,
                    constraints: const BoxConstraints(minHeight: 48),
                    padding: const EdgeInsets.only(top: kDefaultPadding * 0.5),
                    decoration: BoxDecoration(
                        color: themeState.isDarkMode
                            ? primaryColorDark
                            : Colors.white,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(kDMmessageRadius))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        showMedia
                            ? Stack(
                                children: [
                                  CustomMediaAttachment(
                                      onIndexChanged: (value) {},
                                      mediaUrl: mediaUrl),
                                  Positioned(
                                    right: 5,
                                    top: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          showMedia = !showMedia;
                                        });
                                      },
                                      child: Icon(
                                        Icons.cancel,
                                        size: 24,
                                        color: themeState.isDarkMode
                                            ? primaryColorLight
                                            : textColorDark,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
                        MessageComposer(
                          controller: _controller,
                          onTextPressed: () {
                            showPicker = false;
                            hideMEmojiPicker();
                          },
                          onShowPickerPressed: () {
                            if (!showEmojiPicker && !showPicker) {
                              hideKeyboard();
                              setState(() {
                                showPicker = true;
                              });
                            } else if (showEmojiPicker && !showPicker) {
                              hideKeyboard();
                              hideMEmojiPicker();
                              setState(() {
                                showPicker = true;
                              });
                            } else {
                              setState(() {
                                showPicker = false;
                              });
                            }
                          },
                          onShowMediaPressed: () {
                            nextSceneWithAnim(
                                nextScene: PreviewPage(
                              mediaUrl: mediaUrl,
                              onDone: () {
                                previousScene();
                                setState(() {
                                  showMedia = true;
                                });
                              },
                              showButtomThumbnail: (mediaUrl.length > 1),
                              title: 'Preview',
                            ));
                          },
                          textEditingFocus: textFieldFocus,
                          onShowEmojiPressed: () {
                            if (!showEmojiPicker && !showPicker) {
                              hideKeyboard();
                              setState(() {
                                showPicker = false;
                              });
                              showMEmojiPicker();
                            } else if (showPicker && !showEmojiPicker) {
                              setState(() {
                                showPicker = false;
                              });
                              hideKeyboard();
                              showMEmojiPicker();
                            } else {
                              hideMEmojiPicker();
                            }
                          },
                        ),
                        showPicker
                            ? CustomPickFile(onCancel: () {
                                setState(() {
                                  showPicker = !showPicker;
                                });
                              })
                            : const SizedBox.shrink(),
                        showEmojiPicker
                            ? emojiContainer()
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: kDefaultPadding * 0.1,
          ),
          Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24))),
            elevation: kDefaultElevation,
            child: CustomCircularIconButton(
              onPressed: () {},
              icon: Icons.send,
              radius: 24,
            ),
          ),
        ],
      ),
    );
  }

  emojiContainer() {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Offstage(
        offstage: !showEmojiPicker,
        child: SizedBox(
          height: 250,
          child: EmojiPicker(
            textEditingController: _controller,
            onEmojiSelected: (category, emoji) {},
            config: Config(
              columns: 7,
              // Issue: https://github.com/flutter/flutter/issues/28894
              emojiSizeMax: 24 *
                  (foundation.defaultTargetPlatform == TargetPlatform.iOS
                      ? 1.30
                      : 1.0),
              verticalSpacing: 0,
              horizontalSpacing: 0,
              gridPadding: EdgeInsets.zero,
              initCategory: Category.RECENT,
              bgColor: const Color(0xFFF2F2F2),
              indicatorColor: Colors.blue,
              iconColor: Colors.grey,
              iconColorSelected: Colors.blue,
              backspaceColor: Colors.blue,
              skinToneDialogBgColor: Colors.white,
              skinToneIndicatorColor: Colors.grey,
              enableSkinTones: true,
              showRecentsTab: true,
              recentsLimit: 28,
              replaceEmojiOnLimitExceed: false,
              noRecents: const Text(
                'No Recents',
                style: TextStyle(fontSize: 20, color: Colors.black26),
                textAlign: TextAlign.center,
              ),
              loadingIndicator: const SizedBox.shrink(),
              tabIndicatorAnimDuration: kTabScrollDuration,
              categoryIcons: const CategoryIcons(),
              buttonMode: ButtonMode.MATERIAL,
              checkPlatformCompatibility: true,
            ),
          ),
        ),
      ),
    );
  }
}

class MessageComposer extends StatelessWidget {
  final VoidCallback onShowPickerPressed;
  final VoidCallback onShowMediaPressed;
  final VoidCallback onShowEmojiPressed;
  final VoidCallback onTextPressed;
  final TextEditingController controller;

  final FocusNode textEditingFocus;

  const MessageComposer({
    Key? key,
    required this.onShowPickerPressed,
    required this.onShowMediaPressed,
    required this.onShowEmojiPressed,
    required this.textEditingFocus,
    required this.onTextPressed,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => Padding(
        padding: const EdgeInsets.only(
            left: kDefaultPadding * 0.5,
            top: 0,
            right: kDefaultPadding * 0.5,
            bottom: kDefaultPadding * 0.5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onShowEmojiPressed,
              child: Icon(
                Icons.emoji_emotions,
                size: kDefaultIconSize,
                color:
                    themeState.isDarkMode ? accentColorLight : textColorLight,
              ),
            ),
            const SizedBox(
              width: kDefaultPadding * 0.5,
            ),
            Expanded(
              child: TextField(
                focusNode: textEditingFocus,
                onTap: onTextPressed,
                decoration: InputDecoration(
                  hintText: 'Say something...',
                  hintStyle: TextStyle(
                    fontSize: fontSizeModerate,
                    color: themeState.isDarkMode
                        ? primaryColorLight
                        : Colors.grey.shade500,
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(0),
                  border: InputBorder.none,
                  isCollapsed: true,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  fillColor:
                      themeState.isDarkMode ? primaryColorDark : Colors.white,
                ),
                textCapitalization: TextCapitalization.sentences,
                style: TextStyle(
                  fontSize: fontSizeSmall,
                  color: themeState.isDarkMode
                      ? primaryColorLight
                      : textColorLight,
                ),
                maxLines: chatBoxMaxLines,
                minLines: 1,
              ),
            ),
            const SizedBox(
              width: kDefaultPadding * 0.2,
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: onShowPickerPressed,
                    child: Icon(
                      MetroIcon.attachment,
                      color: themeState.isDarkMode
                          ? accentColorLight
                          : textColorLight,
                      size: 24,
                    )),
                const SizedBox(width: kDefaultPadding * 0.5),
                GestureDetector(
                    onTap: onShowMediaPressed,
                    child: Icon(
                      FeatherIcons.camera,
                      color: themeState.isDarkMode
                          ? accentColorLight
                          : textColorLight,
                      size: 24,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
