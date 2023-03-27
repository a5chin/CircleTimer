import 'package:flutter/material.dart';

Color invertColor(Color color) {
  final r = 255 - color.red;
  final g = 255 - color.green;
  final b = 255 - color.blue;
  final a = color.alpha;

  return Color.fromARGB(a, r, g, b);
}
