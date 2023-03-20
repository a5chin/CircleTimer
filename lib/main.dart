import 'package:flutter/material.dart';

import 'package:circle_timer/pages/top.dart';

void main() {
  runApp(const CircleTimer());
}

class CircleTimer extends StatelessWidget {
  const CircleTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CircleTimer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TopPage(),
    );
  }
}
