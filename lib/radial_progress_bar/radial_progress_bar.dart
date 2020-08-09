import 'dart:math' as math show Random;

import 'package:flutter/material.dart';

import './radial_background_painter.dart';
import './animated_radial_progress.dart';
import './animated_content.dart';
import '../bloc/date_bloc.dart';
import '../models/custom_date.dart';

class RadialProgressBar extends StatelessWidget {
  final double size;
  RadialProgressBar(this.size);

  static final random = math.Random();

  static const _activities = {
    0: 'SWIMMING',
    1: 'CYCLING',
    2: 'RUNNING',
    3: 'YOGA',
    4: 'DANCE',
    5: 'GYM',
  };

  @override
  Widget build(BuildContext context) {
    var _sizedBox = SizedBox(
      height: size,
      width: size,
    );
    return Stack(
      children: [
        CustomPaint(
          painter: RadialBackgroundPainter(),
          child: _sizedBox,
        ),
        StreamBuilder<CustomDate>(
          initialData: initialDate,
          stream: dateBloc.dateStream,
          builder: (context, snapshot) {
            var sweepAngle = 90 + (180 * random.nextDouble());
            return AnimatedRadialProgress(
              sweepAngle: sweepAngle,
              child: _sizedBox,
            );
          },
        ),
        Container(
          height: size,
          width: size,
          child: StreamBuilder<CustomDate>(
            initialData: initialDate,
            stream: dateBloc.dateStream,
            builder: (context, snapshot) {
              var calories = 1 + random.nextDouble();
              var index = random.nextInt(6);
              return AnimatedContent(calories, _activities[index]);
            },
          ),
        ),
      ],
    );
  }
}
