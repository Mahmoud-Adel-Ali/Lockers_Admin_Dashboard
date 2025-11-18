import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../manager/maintenance_provider.dart';
import 'maintenance_unit_card.dart';

class MaintenanceUnitsGridView extends StatelessWidget {
  const MaintenanceUnitsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<MaintenanceProvider>();
    var units = prov.filteredMaintenanceUnitsList;

    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        return Skeletonizer(
          enabled: prov.checkGetMaintenanceUnits == null,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //* meaning that the minwidth of the card is 210.
              crossAxisCount: (width / 210).toInt(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 198.5 / 250,
              mainAxisExtent: 200,
            ),
            itemCount: units.length,
            itemBuilder: (context, index) {
              return MaintenanceUnitCard(unit: units[index]);
            },
          ),
        );
      },
    );
  }
}
