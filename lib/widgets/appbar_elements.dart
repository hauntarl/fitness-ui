import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/fitness_icons.dart';
import '../bloc/date_bloc.dart';
import './appbar_title.dart';

class AppBarElements extends StatefulWidget {
  @override
  _AppBarElementsState createState() => _AppBarElementsState();
}

class _AppBarElementsState extends State<AppBarElements>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _fadeController;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    _fadeController = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.addListener(() {
      if (_controller.isCompleted) _controller.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _iconButton(
          FitnessIcons.left_open_big,
          DateEvent.subtract,
        ),
        FadeTransition(
          opacity: _fadeController,
          child: AppBarTitle(),
        ),
        _iconButton(
          FitnessIcons.right_open_big,
          DateEvent.add,
        ),
      ],
    );
  }

  IconButton _iconButton(IconData icon, DateEvent action) {
    return IconButton(
      icon: Icon(
        icon,
        color: ColorPalette.grey,
      ),
      onPressed: () async {
        await _controller.forward();
        dateBloc.dateSink.add(action);
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
