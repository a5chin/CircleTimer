import 'package:flutter/material.dart';

import 'package:circle_timer/pages/top.dart';

void main() {
  runApp(const CircleTimer());
}

class CircleTimer extends StatelessWidget {
  const CircleTimer({super.key});

  @override
  Widget build(BuildContext context) {
    final Color indicatorColor = Theme.of(context).indicatorColor;

    return MaterialApp(
      title: 'CircleTimer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TopPage(
        backgroundColor: Colors.black87,
        indicatorColor: indicatorColor,
        textColor: Colors.white,
      ),
    );
  }
}
