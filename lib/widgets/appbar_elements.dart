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
  Animation<double> _fadeAnimation;
  Animation<double> _scaleAnimation;
  Animation<AlignmentGeometry> _alignAnimation;
  CurvedAnimation _curve;
  DateEvent _event;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _fadeAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(_curve);

    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 0.8,
    ).animate(_curve);

    _alignAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.center,
      end: Alignment.center,
    ).animate(_curve);

    _controller.addListener(() {
      if (_controller.isCompleted) {
        _alignAnimation = Tween<AlignmentGeometry>(
          begin: Alignment.center,
          end: _event == DateEvent.add
              ? Alignment.centerRight
              : Alignment.centerLeft,
        ).animate(_curve);
        setState(() {});
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButtonWidget(
          icon: FitnessIcons.left_open_big,
          event: DateEvent.subtract,
          onPressed: _onPressed,
        ),
        Expanded(
          child: GestureDetector(
            onHorizontalDragEnd: (details) {
              var dx = details.primaryVelocity;
              if (dx == 0) return;
              var event = dx < 0 ? DateEvent.add : DateEvent.subtract;
              _onPressed(event);
            },
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: AlignTransition(
                  alignment: _alignAnimation,
                  child: AppBarTitle(),
                ),
              ),
            ),
          ),
        ),
        IconButtonWidget(
          icon: FitnessIcons.right_open_big,
          event: DateEvent.add,
          onPressed: _onPressed,
        ),
      ],
    );
  }

  void _onPressed(DateEvent action) async {
    _alignAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.center,
      end: action == DateEvent.add
          ? Alignment.centerLeft
          : Alignment.centerRight,
    ).animate(_curve);
    setState(() => _event = action);
    await _controller.forward();
    dateBloc.dateSink.add(action);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class IconButtonWidget extends StatelessWidget {
  final IconData icon;
  final DateEvent event;
  final Function(DateEvent) onPressed;

  const IconButtonWidget({
    @required this.icon,
    @required this.event,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: ColorPalette.grey,
      ),
      onPressed: () => onPressed(event),
    );
  }
}
