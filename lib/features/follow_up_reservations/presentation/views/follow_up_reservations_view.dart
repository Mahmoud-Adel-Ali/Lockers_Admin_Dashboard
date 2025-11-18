import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/api_error_widget.dart';
import '../manager/reservations_provider.dart';
import 'widgets/filter_follow_up_units_location_section.dart';
import 'widgets/follow_up_units_grid_view.dart';

class FollowUpReservationsView extends StatelessWidget {
  const FollowUpReservationsView({super.key});

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
                FilterFollowReservedUnitsLocationSection(),
                SizedBox(height: 8),
                FollowUpUnitsGridView(),
                SizedBox(height: 8),
              ],
            ),
          );
  }
}
