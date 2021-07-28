import 'dart:math';

import 'package:animations_demo/animated-xyz.dart';
import 'package:animations_demo/basic.dart';
import 'package:animations_demo/bubble-effect.dart';
import 'package:animations_demo/simple-anim.dart';
import 'package:animations_demo/tween.dart';
import 'package:animations_demo/xyz-transition.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

extension ExtendedIterable<E> on Iterable<E> {
  /// Like Iterable<T>.map but callback have index as second argument
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }

  void forEachIndexed(void Function(E e, int i) f) {
    var i = 0;
    forEach((e) => f(e, i++));
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Animation Demp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final list = [
    Colors.yellow,
    Colors.blue,
    Colors.black,
    Colors.green,
    Colors.purple
  ];

  final _random = new Random();

  int next(int min, int max) => min + _random.nextInt(max - min);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(50.0),
          child: Stack(
            children: list.mapIndexed((e, i) {
              return Positioned(
                left: next(0, 500).toDouble(),
                top: next(0, 500).toDouble(),
                child: BubbleEffect(
                  child: Container(
                    width: 50,
                    height: 20,
                    color: e,
                  ),
                  delay: Duration(milliseconds: 1000 + i * 150),
                ),
              );
            }).toList(),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
