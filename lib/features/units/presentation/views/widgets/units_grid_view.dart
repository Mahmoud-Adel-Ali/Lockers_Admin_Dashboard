import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widgets/empty_grid_view_widget.dart';
import '../../manager/units_provider.dart';
import 'unit_card.dart';

class UnitsGridView extends StatelessWidget {
  const UnitsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<UnitsProvider>();
    var units = prov.filteredUnits;
    return units.isEmpty
        ? EmptyGridViewWidget(msg: 'No units found')
        : LayoutBuilder(
            builder: (context, constraints) {
              var width = constraints.maxWidth;
              return Skeletonizer(
                enabled: prov.checkGettingAllUnits == null,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //* meaning that the minwidth of the card is 180.
                    crossAxisCount: (width / 180).toInt(),
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 198.5 / 250,
                    mainAxisExtent: 170,
                  ),
                  itemCount: units.length,
                  itemBuilder: (context, index) {
                    return UnitCard();
                  },
                ),
              );
            },
          );
  }
}
