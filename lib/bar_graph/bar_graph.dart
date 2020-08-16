import 'package:flutter/material.dart';

import '../utils/colors.dart';
import './animated_progress_bar.dart';

class BarGraph extends StatelessWidget {
  final double height, width, progress;
  final Color background;
  final Duration duration;
  final Curve curve;

  BarGraph({
    @required this.progress,
    this.height = 130,
    this.width = 3,
    this.background = ColorPalette.grey,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: height,
          width: width,
          color: background,
        ),
        AnimatedProgressBar(
          progress: progress,
          width: width,
          duration: duration,
          curve: curve,
        ),
      ],
    );
  }
}
