import 'package:flutter/material.dart';

class TweenDemo extends StatefulWidget {
  const TweenDemo({Key? key}) : super(key: key);

  @override
  _TweenDemoState createState() => _TweenDemoState();
}

class _TweenDemoState extends State<TweenDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller = new AnimationController(
    vsync: this,
    duration: Duration(seconds: 1),
  );

  late Tween<double> tween = new Tween<double>(begin: 0, end: 100);

  late Animation<double> anim = tween.animate(CurvedAnimation(
    parent: controller,
    curve: Curves.bounceIn,
  ));

  late Animation<Color?> animColor =
      ColorTween(begin: Colors.red, end: Colors.brown).animate(controller);

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
          margin: EdgeInsets.only(left: anim.value),
          child: Text('Controller value: ${controller.value}'),
        ),
        Container(
          width: 200,
          height: 200,
          color: animColor.value,
        ),
        TextButton(
          onPressed: () {
            controller.forward();
          },
          child: Text('Start'),
        ),
        TextButton(
          onPressed: () {
            controller.reverse();
          },
          child: Text('Back'),
        ),
        TextButton(
          onPressed: () {
            controller.repeat();
          },
          child: Text('Repeat'),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
