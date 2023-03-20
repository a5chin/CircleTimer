import 'package:flutter/material.dart';

import 'package:circle_timer/utils/color.dart';
import 'package:circle_timer/widgets/clock.dart';

class TopPage extends StatefulWidget {
  const TopPage(
      {super.key,
      required this.backgroundColor,
      required this.indicatorColor,
      required this.textColor});
  final Color backgroundColor;
  final Color indicatorColor;
  final Color textColor;

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Material(
            child: _buildInk(context),
          );
        },
      ),
    );
  }

  Widget _buildInk(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        gradient: _buildLinearGradient(widget.indicatorColor),
      ),
      child: InkWell(
        child: Clock(
          controller: _controller,
          indicatorColor: widget.indicatorColor,
          textColor: widget.textColor,
        ),
        onTap: () => _handleOnTap(),
      ),
    );
  }

  LinearGradient _buildLinearGradient(Color indicatorColor) {
    return LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      colors: [
        widget.backgroundColor,
        widget.backgroundColor,
        invertColor(indicatorColor),
      ],
      stops: [
        0,
        1 - _controller.value,
        1 - _controller.value,
      ],
    );
  }

  void _handleOnTap() {
    if (_controller.isAnimating) {
      _controller.stop();
    } else {
      _controller.reverse(
        from: _controller.value == 0.0 ? 1.0 : _controller.value,
      );
    }
  }
}
