import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
        ],
      ),
    );
  }
}
