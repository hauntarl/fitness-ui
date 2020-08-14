import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/fitness_icons.dart';

class AnimatedMenuButton extends StatefulWidget {
  final Function onTap;
  AnimatedMenuButton({this.onTap});
  @override
  _AnimatedMenuButtonState createState() => _AnimatedMenuButtonState();
}

class _AnimatedMenuButtonState extends State<AnimatedMenuButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _turnAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

    _turnAnimation = Tween<double>(
      begin: 0,
      end: 0.125,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        setState(() {
          _controller.isCompleted
              ? _controller.reverse()
              : _controller.forward();
        });
      },
      child: RotationTransition(
        turns: _turnAnimation,
        child: Icon(
          FitnessIcons.plus_circle,
          color: ColorPalette.red,
          size: 45,
        ),
      ),
    );
  }
}
