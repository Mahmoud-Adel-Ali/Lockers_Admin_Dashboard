
import 'package:flutter/material.dart';

import 'units_or_lockers_percent_indicator.dart';

class LockersIndecator extends StatelessWidget {
  const LockersIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return UnitsOrLockersPercentIndicator(
      title: 'الخزائن',
      textOne: 'الخزائن المتاحة',
      textTwo: 'خزائن في الصيانة',
      percentIndecator: 0.15,
      textIndecator: '29\nفي الصيانة',
    );
  }
}
