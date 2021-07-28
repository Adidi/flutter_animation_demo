import 'package:flutter/material.dart';

class XYZTransition extends StatefulWidget {
  const XYZTransition({Key? key}) : super(key: key);

  @override
  _XYZTransitionState createState() => _XYZTransitionState();
}

class _XYZTransitionState extends State<XYZTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController cont = new AnimationController(
      vsync: this, duration: Duration(milliseconds: 500));

  @override
  void initState() {
    super.initState();

    cont.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        cont.reverse();
      } else if (status == AnimationStatus.dismissed) {
        cont.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScaleTransition(
          scale: Tween<double>(
            begin: 1,
            end: 3,
          ).animate(cont),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.black38,
          ),
        ),
        TextButton(
          onPressed: () {
            cont.forward();
          },
          child: Text('Play'),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    cont.dispose();
  }
}
