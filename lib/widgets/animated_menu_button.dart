import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AnimatedMenuButton extends StatefulWidget {
  final Function onTap;
  AnimatedMenuButton({this.onTap});
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
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorPalette.red,
          style: BorderStyle.solid,
          width: 2,
        ),
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: () {
          widget.onTap();
          setState(() {
            _controller.isCompleted
                ? _controller.reverse()
                : _controller.forward();
          });
        },
        child: AnimatedIcon(
          size: 35,
          icon: AnimatedIcons.menu_close,
          progress: _controller.view,
          color: ColorPalette.red,
        ),
      ),
    );
  }
}
