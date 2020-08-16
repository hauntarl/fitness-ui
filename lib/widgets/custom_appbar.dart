import 'package:flutter/material.dart';

import './appbar_elements.dart';
import '../utils/colors.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomShapePainter(),
      child: Container(
        height: 200,
        padding: EdgeInsets.only(top: 20),
        child: AppBarElements(),
      ),
    );
  }
}

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height, w = size.width;
    var color = ColorPalette.purple;
    var paint = Paint();

    var path = Path()
      ..lineTo(0, h * 0.75)
      ..quadraticBezierTo(w * 0.02, h * 0.725, w * 0.06, h * 0.65)
      ..quadraticBezierTo(w * 0.15, h * 0.45, w * 0.275, h * 0.75)
      ..quadraticBezierTo(w * 0.375, h, w * 0.5, h * 0.6)
      ..quadraticBezierTo(w * 0.55, h * 0.45, w * 0.65, h * 0.5)
      ..quadraticBezierTo(w * 0.7, h * 0.525, w * 0.775, h * 0.675)
      ..quadraticBezierTo(w * 0.9, h * 0.9, w, h * 0.45)
      ..lineTo(w, 0)
      ..close();
    paint.color = color;
    canvas.drawPath(path, paint);

    path = Path()
      ..quadraticBezierTo(w * 0.05, h * 0.75, w * 0.15, h * 0.8)
      ..quadraticBezierTo(w * 0.25, h * 0.85, w * 0.3, h * 0.4)
      ..quadraticBezierTo(w * 0.4, h * 0.8, w * 0.475, h * 0.9)
      ..quadraticBezierTo(w * 0.55, h, w * 0.65, h * 0.6)
      ..quadraticBezierTo(w * 0.7, h * 0.45, w * 0.775, h * 0.675)
      ..quadraticBezierTo(w * 0.9, h, w, h * 0.45)
      ..lineTo(w, 0)
      ..close();
    paint.color = color.withOpacity(0.5);
    canvas.drawPath(path, paint);

    path = Path()
      ..lineTo(0, h * 0.75)
      ..quadraticBezierTo(w * 0.03, h * 0.65, w * 0.2, h * 0.9)
      ..quadraticBezierTo(w * 0.3, h, w * 0.4, h * 0.75)
      ..quadraticBezierTo(w * 0.5, h * 0.6, w * 0.7, h * 0.85)
      ..quadraticBezierTo(w * 0.825, h * 0.95, w, 0)
      ..lineTo(w, 0)
      ..close();
    paint.color = color.withOpacity(0.125);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => this != oldDelegate;
}
