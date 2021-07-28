import 'package:flutter/material.dart';

class Comp extends StatelessWidget {
  const Comp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 100, height: 100, color: Colors.red),
        Container(width: 100, height: 100, color: Colors.blue),
        Container(
          width: 100,
          height: 100,
          color: Colors.yellow,
        ),
      ],
    );
  }
}
