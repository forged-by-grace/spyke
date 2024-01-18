import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  final Widget child;
  final Duration interval;
  final bool isDelayed;

  const SlideAnimation(
      {super.key,
      required this.child,
      required this.interval,
      required this.isDelayed});

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.interval,
    );

    _slideAnim =
        Tween<Offset>(begin: const Offset(1.1, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: _animationController, curve: Curves.easeOut));

    if (widget.isDelayed) {
      Future.delayed(const Duration(seconds: 2), () {
        _animationController.forward();
      });
    } else {
      _animationController.forward();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _slideAnim, child: widget.child,);
  }
}
