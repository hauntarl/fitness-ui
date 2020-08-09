import 'package:flutter/material.dart';

import './radial_progress_painter.dart';

class AnimatedRadialProgress extends StatefulWidget {
  final Widget child;
  final double startAngle, sweepAngle;

  AnimatedRadialProgress({
    @required this.child,
    @required this.sweepAngle,
    this.startAngle = 110,
  });
  @override
  _AnimatedRadialProgressState createState() => _AnimatedRadialProgressState();
}

class _AnimatedRadialProgressState extends State<AnimatedRadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _progressAnimation;
  CurvedAnimation _curve;
  double _oldSweepAngle;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _progressAnimation = Tween<double>(
      begin: 0,
      end: widget.sweepAngle,
    ).animate(_curve);

    _controller.addListener(() => setState(() {}));
    _controller.forward();
    _oldSweepAngle = widget.sweepAngle;
  }

  @override
  void didUpdateWidget(AnimatedRadialProgress oldWidget) {
    _controller.reset();

    _progressAnimation = Tween(
      begin: _oldSweepAngle,
      end: widget.sweepAngle,
    ).animate(_curve);

    _controller.forward();
    _oldSweepAngle = widget.sweepAngle;

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RadialProgressPainter(
        startAngle: widget.startAngle,
        sweepAngle: _progressAnimation.value,
      ),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
