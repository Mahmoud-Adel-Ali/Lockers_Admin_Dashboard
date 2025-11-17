import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../manager/home_provider.dart';
import 'units_or_lockers_percent_indicator.dart';

class UnitsIndecator extends StatelessWidget {
  const UnitsIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<HomeProvider>();
    double percentIndecator =
        prov.unitsUnderMaintenance /
        (prov.totalUnits == 0 ? 1 : prov.totalUnits);
    return UnitsOrLockersPercentIndicator(
      title: 'الوحدات',
      textOne: 'الوحدات المتاحة',
      textTwo: 'وحدات في الصيانة',
      percentIndecator: 1 - percentIndecator,
      textIndecator: '${prov.unitsUnderMaintenance}\nفي الصيانة',
    );
  }
}
