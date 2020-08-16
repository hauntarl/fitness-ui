import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AnimatedProgressBar extends StatefulWidget {
  const AnimatedProgressBar({
    @required this.progress,
    @required this.width,
    @required this.duration,
    @required this.curve,
  });

  final double progress;
  final double width;
  final Duration duration;
  final Curve curve;
  static final math.Random random = math.Random();

  @override
  _AnimatedProgressBarState createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _heightAnimation;
  CurvedAnimation _curvedAnimation;
  double _progress;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    _heightAnimation = Tween<double>(
      begin: 0,
      end: widget.progress,
    ).animate(_curvedAnimation);

    _progress = widget.progress;
    _controller.forward();
    _controller.addListener(() {
      if (_controller.isCompleted) {
        _controller.reset();

        var pnew = widget.progress * AnimatedProgressBar.random.nextDouble();
        _heightAnimation = Tween<double>(
          begin: _progress,
          end: pnew,
        ).animate(_curvedAnimation);

        setState(() => _progress = pnew);
        _controller.forward();
      } else
        setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _heightAnimation.value,
      width: widget.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorPalette.barBottom,
            ColorPalette.barTop,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
