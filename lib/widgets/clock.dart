import 'package:flutter/material.dart';

import 'package:circle_timer/widgets/circle.dart';

class Clock extends StatefulWidget {
  const Clock(
      {Key? key,
      required this.controller,
      required this.indicatorColor,
      required this.textColor})
      : super(key: key);
  final AnimationController controller;
  final Color indicatorColor;
  final Color textColor;

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  String get timeToString {
    Duration duration = widget.controller.duration! * widget.controller.value;
    int strLength = duration.toString().length - 7;

    return widget.controller.isAnimating
        ? duration.toString().substring(0, strLength)
        : widget.controller.duration.toString().substring(0, strLength);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Positioned(
          width: size.shortestSide * 0.8,
          height: size.shortestSide * 0.8,
          child: CustomPaint(
            painter: CircleTimePainter(
              animation: widget.controller,
              backgroundColor: widget.textColor,
              indicatorColor: widget.indicatorColor,
            ),
          ),
        ),
        Align(
          alignment: FractionalOffset.center,
          child: Text(
            timeToString,
            style: TextStyle(
              fontSize: size.shortestSide / 8,
              color: widget.textColor,
            ),
          ),
        ),
      ],
    );
  }
}
