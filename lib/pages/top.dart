import 'package:flutter/material.dart';

import 'package:circle_timer/widgets/clock.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

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
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Material(
            color: Colors.black54,
            child: InkWell(
              child: Clock(controller: _controller),
              onTap: () => {
                if (_controller.isAnimating)
                  {_controller.stop()}
                else
                  {
                    _controller.reverse(
                        from:
                            _controller.value == 0.0 ? 1.0 : _controller.value)
                  },
              },
            ),
          );
        },
      ),
    );
  }
}
