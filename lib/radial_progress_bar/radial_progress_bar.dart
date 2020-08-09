import 'dart:math' as math show Random;

import 'package:flutter/material.dart';

import './radial_background_painter.dart';
import './animated_radial_progress.dart';
import '../bloc/date_bloc.dart';
import '../models/custom_date.dart';
import '../utils/colors.dart';

class RadialProgressBar extends StatelessWidget {
  final double size;
  RadialProgressBar(this.size);

  static final random = math.Random();

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('RUNNING', style: kHeading),
              kDivider,
              SizedBox(height: 10),
              StreamBuilder<Object>(
                initialData: initialDate,
                stream: dateBloc.dateStream,
                builder: (context, snapshot) {
                  var calories = 1 + random.nextDouble();
                  return Text('${calories.toStringAsFixed(3)}', style: kValue);
                },
              ),
              Text('CALORIES BURN', style: kSubhead),
            ],
          ),
        ),
      ],
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
