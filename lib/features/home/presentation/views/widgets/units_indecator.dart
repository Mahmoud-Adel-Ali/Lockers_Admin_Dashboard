import 'package:flutter/material.dart';

import 'units_or_lockers_percent_indicator.dart';

class UnitsIndecator extends StatelessWidget {
  const UnitsIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return UnitsOrLockersPercentIndicator(
      title: 'الوحدات',
      textOne: 'الوحدات المتاحة',
      textTwo: 'وحدات في الصيانة',
      percentIndecator: 0.55,
      textIndecator: '23\nفي الصيانة',
    );
  }
}
