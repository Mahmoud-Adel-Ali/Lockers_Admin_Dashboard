import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/widgets/empty_grid_view_widget.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../manager/units_provider.dart';
import 'locker_card.dart';

class LockersGridView extends StatelessWidget {
  const LockersGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<UnitsProvider>();
    var lockers = prov.selectedUnit?.lockers ?? [];
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        return lockers.isEmpty
            ? EmptyGridViewWidget(msg: 'لا يوجد خزائن بعد')
            : Skeletonizer(
                enabled: prov.checkGettingUnitDetails == null,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //* meaning that the minwidth of the card is 160.
                    crossAxisCount: (width / 160).toInt(),
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 194 / 164,
                    mainAxisExtent: 150,
                  ),
                  itemCount: lockers.length,
                  itemBuilder: (context, index) {
                    return LockerCard();
                  },
                ),
              );
      },
    );
  }
}
