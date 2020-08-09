import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/animated_menu_button.dart';
import '../radial_progress_bar/radial_progress_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomAppBar(),
          RadialProgressBar(225),
          Container(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                AnimatedMenuButton(
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
