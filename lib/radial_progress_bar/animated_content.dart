import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AnimatedContent extends StatefulWidget {
  final double calories;
  final String activity;
  AnimatedContent(this.calories, this.activity);

  @override
  _AnimatedContentState createState() => _AnimatedContentState();
}

class _AnimatedContentState extends State<AnimatedContent>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _curve;
  Animation<double> _fadeAnimation;
  Animation<double> _scaleAnimation;
  double _calories;
  String _activity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _fadeAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(_curve);

    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 1.25,
    ).animate(_curve);

    _calories = widget.calories;
    _activity = widget.activity;
    _controller.addListener(() {
      if (_controller.isCompleted) {
        _controller.reverse();
        _calories = widget.calories;
        _activity = widget.activity;
        setState(() {});
      }
    });
  }

  @override
  void didUpdateWidget(AnimatedContent oldWidget) {
    _controller.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_activity, style: kHeading),
            kDivider,
            SizedBox(height: 10),
            Text('${_calories.toStringAsFixed(3)}', style: kValue),
            Text('CALORIES BURN', style: kSubhead),
          ],
        ),
      ),
    );
  }
}

const kHeading = TextStyle(
  letterSpacing: 4,
  fontSize: 20,
);

const kValue = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 43,
  letterSpacing: 1.1,
);

const kSubhead = TextStyle(
  color: ColorPalette.purple,
  letterSpacing: 4,
  fontWeight: FontWeight.w500,
);

const kDivider = Divider(
  color: ColorPalette.purple,
  thickness: 3,
  indent: 70,
  endIndent: 70,
);
