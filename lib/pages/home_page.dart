import 'package:fitness_ui/utils/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/animated_menu_button.dart';
import '../radial_progress_bar/radial_progress_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: Center(
              child: RadialProgressBar(225),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _data,
              AnimatedMenuButton(
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget get _data {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          _dataRow(
            date: 'February 2020',
            status: 'On going',
            task: 'Lose weight',
            progress: '3.8 ktgt / 7 kg',
          ),
          _dataRow(
            date: 'January 2020',
            status: 'Failed',
            task: 'Running per month',
            progress: '15.3km / 20km',
          ),
          _dataRow(
            date: 'December 2019',
            status: 'Completed',
            task: 'Avg. steps per day',
            progress: '10000 / 10000',
          ),
        ],
      ),
    );
  }

  Widget _dataRow({
    String date,
    String status,
    String task,
    String progress,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date, style: kHead),
                SizedBox(height: 2),
                Text(status, style: kSub),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task,
                  style: kHead.copyWith(color: Colors.black.withOpacity(0.7)),
                ),
                SizedBox(height: 2),
                Text(progress, style: kSub),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const kHead = TextStyle(
  color: ColorPalette.purple,
  fontWeight: FontWeight.w500,
  fontSize: 15,
);

const kSub = TextStyle(
  color: Colors.black38,
  fontStyle: FontStyle.italic,
  fontSize: 14,
  letterSpacing: 1.2,
);
