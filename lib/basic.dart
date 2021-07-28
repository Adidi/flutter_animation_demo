import 'package:flutter/material.dart';

class Basic extends StatefulWidget {
  const Basic({Key? key}) : super(key: key);

  @override
  _BasicState createState() => _BasicState();
}

class _BasicState extends State<Basic> with SingleTickerProviderStateMixin {
  late AnimationController controller = new AnimationController(
    vsync: this,
    duration: Duration(seconds: 1),
  );

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
          child: Text('Controller value: ${controller.value}'),
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
