import 'package:flutter/material.dart';

import '../utils/styles.dart';
import '../models/custom_date.dart';
import '../bloc/date_bloc.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CustomDate>(
      initialData: initialDate,
      stream: dateBloc.dateStream,
      builder: (context, snapshot) {
        var customDate = snapshot.data;
        return Column(
          children: [
            Text(
              customDate.weekday,
              style: Styles.title,
            ),
            SizedBox(height: 2),
            Text(
              customDate.formatted,
              style: Styles.subtitle,
            ),
          ],
        );
      },
    );
  }
}
