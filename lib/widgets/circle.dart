import 'dart:math' as math;

import 'package:flutter/material.dart';

class CircleTimePainter extends CustomPainter {
  final Animation<double> animation;
  final Color backgroundColor;
  final Color indicatorColor;

  const CircleTimePainter({
    required this.animation,
    required this.backgroundColor,
    required this.indicatorColor,
  }) : super();

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 30.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    final center = size.center(Offset.zero);
    canvas.drawCircle(center, size.width / 2.0, paint);

    paint.color = indicatorColor;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2.0),
        math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
