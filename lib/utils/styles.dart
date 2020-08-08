import 'package:flutter/material.dart';

import './colors.dart';

class Styles {
  Styles._();
  static const title = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w900,
    letterSpacing: 2,
  );
  static const subtitle = TextStyle(
    color: ColorPalette.grey,
    fontSize: 15,
    letterSpacing: 1.5,
    wordSpacing: 1.5,
  );
}
