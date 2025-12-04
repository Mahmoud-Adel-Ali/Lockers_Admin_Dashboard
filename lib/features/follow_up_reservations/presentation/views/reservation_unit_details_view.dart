import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/api_error_widget.dart';
import '../manager/reservations_provider.dart';
import 'widgets/reservations_customers_grid_view.dart';
import 'widgets/reservation_unit_details_header_view.dart';

class FollowUpReservationsDetailsView extends StatelessWidget {
  const FollowUpReservationsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ReservationsProvider>();
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 8),
          FollowUpReservationsDetailsHeaderView(),
          SizedBox(height: 8),
          prov.checkGettingUnitDetails == false
              ? ApiErrorView(msg: prov.message, onRetry: prov.getUnitDetails)
              : prov.checkGettingUnitDetails == null
              ? SizedBox(
                  width: 300,
                  height: 500,
                  child: const Center(child: LinearProgressIndicator()),
                )
              : ReservationCustomersGridView(),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
