import 'package:flutter/material.dart';
import 'package:spyke/enum/online_status.dart';
import 'package:spyke/utility/constants.dart';

class CustomDpWithIndicator extends StatelessWidget {
  final int onlineStatus;
  final String? dpUrl;
  final double? radius;
  final VoidCallback? onPressed;

  const CustomDpWithIndicator(
      {Key? key,
      required this.onlineStatus,
      this.dpUrl,
      this.radius,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: (radius != null) ? (radius! * 2) : 48,
        width: (radius != null) ? (radius! * 2) : 48,
        child: Stack(fit: StackFit.expand, children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 24)),
            child: CircleAvatar(
              radius: radius ?? 24,
              child: Image.asset(
                dpUrl ?? 'assets/images/b4.jpg',
                fit: BoxFit.cover,
                width: (radius != null) ? (radius! * 2) : 48,
                height: (radius != null) ? (radius! * 2) : 48,
              ),
            ),
          ),
          (onlineStatus != OnlineStatus.offline.index)
              ? Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: (radius != null) ? (radius! * 0.25) : 6,
                    backgroundColor: accentColorLight,
                    child: CircleAvatar(
                      radius: (radius != null) ? (radius! * 0.2) : 5,
                      backgroundColor: getOnlineIndicatorColor(onlineStatus),
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ]),
      ),
    );
  }

  getOnlineIndicatorColor(int onlineStatus) {
    return onlineStatus == OnlineStatus.active.index
        ? Colors.green
        : Colors.amber;
  }
}
