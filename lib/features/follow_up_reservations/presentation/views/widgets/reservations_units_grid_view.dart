import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widgets/empty_grid_view_widget.dart';
import '../../manager/reservations_provider.dart';
import 'reservation_unit_card.dart';

class ReservationsUnitsGridView extends StatelessWidget {
  const ReservationsUnitsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ReservationsProvider>();
    var units = prov.filteredUnits;
    return units.isEmpty
        ? EmptyGridViewWidget(msg: 'لا توجد وحدات بعد')
        : LayoutBuilder(
            builder: (context, constraints) {
              var width = constraints.maxWidth;
              return Skeletonizer(
                enabled: prov.checkGettingAllUnits == null,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //* meaning that the minwidth of the card is 150.
                    crossAxisCount: (width / 150).toInt(),
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1,
                    mainAxisExtent: 150,
                  ),
                  itemCount: units.length,
                  itemBuilder: (context, index) {
                    return ReservationUnitCard(unit: units[index]);
                  },
                ),
              );
            },
          );
  }
}
