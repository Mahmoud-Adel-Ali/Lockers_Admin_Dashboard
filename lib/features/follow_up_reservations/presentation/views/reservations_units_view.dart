import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/api_error_widget.dart';
import '../manager/reservations_provider.dart';
import 'widgets/filter_reservations_units_location_section.dart';
import 'widgets/reservations_units_grid_view.dart';

class ReservationsUnitsView extends StatelessWidget {
  const ReservationsUnitsView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ReservationsProvider>();
    return prov.checkGettingAllUnits == false
        ? ApiErrorView(
            msg: prov.message,
            onRetry: () {
              prov.getAllRegions();
              prov.getAllUnits();
            },
          )
        : SingleChildScrollView(
            child: const Column(
              children: [
                SizedBox(height: 8),
                ReservationsUnitsLocationSection(),
                SizedBox(height: 8),
                ReservationsUnitsGridView(),
                SizedBox(height: 8),
              ],
            ),
          );
  }
}
