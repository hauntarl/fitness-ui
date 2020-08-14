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
  AnimationController _fadeController;
  Animation _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _fadeAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    ));

    _fadeController.addListener(() {
      if (_fadeController.isCompleted) _fadeController.reverse();
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
        GestureDetector(
          onHorizontalDragEnd: (details) {
            var dx = details.primaryVelocity;
            if (dx < 0) {
              _onPressed(DateEvent.add);
            } else if (dx > 0) _onPressed(DateEvent.subtract);
          },
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: AppBarTitle(),
          ),
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
      onPressed: () => _onPressed(action),
    );
  }

  void _onPressed(DateEvent action) async {
    await _fadeController.forward();
    dateBloc.dateSink.add(action);
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }
}
