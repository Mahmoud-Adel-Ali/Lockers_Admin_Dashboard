import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../manager/maintenance_provider.dart';
import 'maintenance_locker_card.dart';

class MaintenanceLockersGridView extends StatelessWidget {
  const MaintenanceLockersGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<MaintenanceProvider>();
    var lockers = prov.filteredMaintenanceLockersList;

    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        return Skeletonizer(
          enabled: prov.checkGetMaintenanceLockers == null,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //* meaning that the minwidth of the card is 210.
              crossAxisCount: (width / 210).toInt(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 200 / 250,
              mainAxisExtent: 200,
            ),
            itemCount: lockers.length,
            itemBuilder: (context, index) {
              return MaintenanceLockerCard(locker: lockers[index]);
            },
          ),
        );
      },
    );
  }
}
