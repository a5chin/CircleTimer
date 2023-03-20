import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key, required this.controller}) : super(key: key);
  final AnimationController controller;

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  String get timeToString {
    Duration duration = widget.controller.duration! * widget.controller.value;
    return widget.controller.isAnimating
        ? duration.toString()
        : widget.controller.duration.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(timeToString),
    );
  }
}
