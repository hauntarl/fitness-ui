import 'package:flutter/material.dart';

import './custom_shape_painter.dart';
import './appbar_elements.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    return CustomPaint(
      painter: CustomShapePainter(),
      child: Container(
        height: 180 + statusBarHeight,
        padding: EdgeInsets.only(top: statusBarHeight + 10),
        child: AppBarElements(),
      ),
    );
  }
}
