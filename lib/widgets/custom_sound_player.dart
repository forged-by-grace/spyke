import 'package:flutter/material.dart';
import 'package:spyke/utility/constants.dart';

class CustomSoundPlayer extends StatefulWidget {
  final bool isSender;
  final String url;

  const CustomSoundPlayer({Key? key, required this.isSender, required this.url})
      : super(key: key);

  @override
  State<CustomSoundPlayer> createState() => _CustomSoundPlayerState();
}

class _CustomSoundPlayerState extends State<CustomSoundPlayer> {
  late bool isPlaying;
  late double duration; //in seconds
  late double progress;

  @override
  void initState() {
    isPlaying = false;
    duration = 0.0;
    progress = 0.0;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isPlaying ? Icons.pause_circle : Icons.play_circle,
          color: widget.isSender ? accentColorLight : primaryColorLight,
          size: kDefaultIconSize,
        ),
        Expanded(
            child: Slider(
                value: 50,
                activeColor:
                    widget.isSender ? accentColorLight : primaryColorLight,
                onChanged: (value) {})),
        Text('${progress.toInt()}')
      ],
    );
  }
}
