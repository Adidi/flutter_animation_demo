import 'package:animations_demo/comp.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SimpleAnim extends StatelessWidget {
  const SimpleAnim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
      builder: (ctx, child, value) {
        return Padding(
          padding: EdgeInsets.only(left: value),
          child: child,
        );
      },
      child: Comp(),
      tween: Tween<double>(begin: 100, end: 1000),
    );
  }
}
