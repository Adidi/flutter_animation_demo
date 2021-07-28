import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AnimProps { scale, angle, opacity }

class BubbleEffect extends StatelessWidget {
  const BubbleEffect({
    Key? key,
    required this.child,
    required this.delay,
  }) : super(key: key);

  final Widget child;
  final Duration delay;

  TimelineTween<AnimProps> getTween() {
    var tween = TimelineTween<AnimProps>();

    var scene =
        tween.addScene(begin: Duration.zero, end: Duration(milliseconds: 2000));
    scene.animate(AnimProps.scale, tween: Tween(begin: 0, end: 1));
    scene.animate(AnimProps.angle, tween: Tween(begin: 25, end: 0));

    var scene1 = tween.addScene(
        begin: Duration(milliseconds: 0), end: Duration(milliseconds: 1500));
    scene1.animate(AnimProps.opacity, tween: Tween(begin: 0, end: 0));

    var scene2 = tween.addScene(
        begin: Duration(milliseconds: 1500), end: Duration(milliseconds: 2000));
    scene2.animate(AnimProps.opacity, tween: Tween(begin: 0, end: 1));

    return tween;
  }

  @override
  Widget build(BuildContext context) {
    var tween = getTween();

    return PlayAnimation<TimelineValue<AnimProps>>(
      builder: (ctx, child, value) {
        return Transform.rotate(
          angle: 0,
          child: Transform.scale(
            scale: value.get(AnimProps.scale),
            child: Opacity(
              opacity: value.get(AnimProps.opacity),
              child: child,
            ),
          ),
        );
      },
      duration: tween.duration,
      curve: Curves.bounceOut,
      tween: tween,
      child: child,
      delay: delay,
    );
  }
}
