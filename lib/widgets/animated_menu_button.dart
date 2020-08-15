import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AnimatedMenuButton extends StatefulWidget {
  final Function onTap;
  AnimatedMenuButton({@required this.onTap});
  @override
  _AnimatedMenuButtonState createState() => _AnimatedMenuButtonState();
}

class _AnimatedMenuButtonState extends State<AnimatedMenuButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
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
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorPalette.red,
            style: BorderStyle.solid,
            width: 2,
          ),
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(5),
        child: AnimatedIcon(
          progress: _controller.view,
          icon: AnimatedIcons.menu_close,
          color: ColorPalette.red,
          size: 30,
        ),
      ),
    );
  }
}
