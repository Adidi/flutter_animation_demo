import 'package:flutter/material.dart';

class AnimatedXYZ extends StatefulWidget {
  const AnimatedXYZ({Key? key}) : super(key: key);

  @override
  _AnimatedXYZState createState() => _AnimatedXYZState();
}

class _AnimatedXYZState extends State<AnimatedXYZ> {
  double opacity = 1;

  double width = 100;
  double height = 100;
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedOpacity(
          opacity: opacity,
          duration: Duration(milliseconds: 500),
          child: Container(
            color: Colors.purple,
            width: 100,
            height: 100,
          ),
        ),
        AnimatedContainer(
          width: width,
          height: height,
          color: color,
          duration: Duration(seconds: 1),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              opacity = opacity == 1 ? 0 : 1;
              width = 200;
              height = 500;
              color = Colors.yellow;
            });
          },
          child: Text('Change'),
        ),
      ],
    );
  }
}
