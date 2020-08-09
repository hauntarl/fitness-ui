import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

import '../utils/colors.dart';

class RadialProgressPainter extends CustomPainter {
  final double startAngle, sweepAngle;
  RadialProgressPainter({
    @required this.startAngle,
    @required this.sweepAngle,
  });

  static const _linearGradient = LinearGradient(
    colors: [
      ColorPalette.red,
      ColorPalette.purple,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height, w = size.width;
    var center = Offset(w / 2, h / 2);

    var progress = Paint()
      ..shader = _linearGradient.createShader(Rect.fromCircle(
        center: center,
        radius: w / 2,
      ))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: w / 2,
      ),
      math.radians(startAngle),
      math.radians(sweepAngle),
      false,
      progress,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => this != oldDelegate;
}
