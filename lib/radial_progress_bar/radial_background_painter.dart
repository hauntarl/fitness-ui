import 'package:flutter/material.dart';

import '../utils/colors.dart';

class RadialBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height, w = size.width;
    var center = Offset(w / 2, h / 2);

    var background = Paint()
      ..color = ColorPalette.grey
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12;

    canvas.drawCircle(center, w / 2, background);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => this != oldDelegate;
}
