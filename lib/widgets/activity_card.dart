import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    @required this.background,
    @required this.activity,
    @required this.imagePath,
  });

  final Color background;
  final String activity, imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 100,
      decoration: BoxDecoration(
        color: background,
        boxShadow: [
          BoxShadow(
            color: background.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            imagePath,
            height: 50,
            width: 100,
          ),
          kDivider,
          Text(activity, style: kStyle),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

const kStyle = TextStyle(
  color: Colors.white,
  letterSpacing: 1.2,
);

const kDivider = Divider(
  color: Colors.white,
  thickness: 3,
  indent: 12,
  endIndent: 12,
);
