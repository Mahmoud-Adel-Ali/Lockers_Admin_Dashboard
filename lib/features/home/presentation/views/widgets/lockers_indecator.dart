import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../manager/home_provider.dart';
import 'units_or_lockers_percent_indicator.dart';

class LockersIndecator extends StatelessWidget {
  const LockersIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<HomeProvider>();
    double percentIndecator =
        prov.lockersUnderMaintenance /
        (prov.totalLockers == 0 ? 1 : prov.totalLockers);
    return UnitsOrLockersPercentIndicator(
      title: 'الخزائن',
      textOne: 'الخزائن المتاحة',
      textTwo: 'خزائن في الصيانة',
      percentIndecator: 1 - percentIndecator,
      textIndecator: '${prov.lockersUnderMaintenance}\nفي الصيانة',
    );
  }
}
